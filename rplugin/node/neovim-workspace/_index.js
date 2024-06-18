const path = require("node:path");
const fs = require("node:fs/promises");

module.exports = (plugin) => {
  // plugin global data
  const data = {
    workspacePath: null,
    workspaceConfig: null,
  };

  console.log = (...args) => {
    plugin.nvim.outWrite(args.join(" ") + "\n");
  };

  console.error = (...args) => {
    plugin.nvim.errWrite("ERROR ===> " + args.join(" ") + "\n");
  };

  async function getNeovimDataPath() {
    try {
      return await plugin.nvim.request("nvim_exec_lua", [
        'return vim.fn.stdpath("data")',
        [],
      ]);
    } catch (err) {
      console.error(err);
      return;
    }
  }

  async function getWorkspacePath(dirPath) {
    try {
      const workspacePath = path.join(dirPath, "workspace");
      try {
        const stat = await fs.stat(workspacePath);
        if (stat.isDirectory()) {
          return workspacePath;
        } else {
          throw new Erorr(
            `Path ${workspacePath} exists but is not a directory.`,
          );
        }
      } catch (err) {
        if (err.code === "ENOENT") {
          await fs.mkdir(workspacePath, { recursive: true });
          return workspacePath;
        }
        throw err;
      }
    } catch (err) {
      throw err;
    }
  }

  async function getWorkspaceConfig(workspacePath) {
    const workspaceConfigPath = path.join(workspacePath, "config.json");
    try {
      const configStr = await fs.readFile(workspaceConfigPath, "utf8");
      const config = JSON.parse(configStr);
      console.log("configStr", configStr);
      return config;
    } catch (err) {
      if (err.code === "ENOENT") {
        await fs.writeFile(workspaceConfigPath, "[]", "utf8");
        return [];
      }
      throw err;
    }
  }

  async function createWorkspace({
    name,
    dirPathArray,
    symlinkNameArray,
  } = {}) {
    if (!name) {
      throw new Error("must need a workspace name");
    }
    if ((!dirPathArray) instanceof Array) {
      throw new Error("dirPathArray must be array");
    }
    for (let i = 0; i < dirPathArray.length; i++) {
      try {
        await fs.access(dirPathArray[i]);
      } catch (err) {
        throw new Error(`${dirPathArray} is not a valid path`);
      }
    }
    if (data.workspaceConfig[name]) {
      throw new Error(`exist same workspace name`);
    }
    const newWorkspaceDirPath = await (async function createWorksapceDir(
      workspaceName,
    ) {
      const newWorkspaceDirPath = path.join(data.workspacePath, workspaceName);
      await fs.mkdir(newWorkspaceDirPath);
      return newWorkspaceDirPath;
    })(name);

    async function createSymbolLink(workspaceDirPath, symlinkName, targetPath) {
      const symlinkPath = path.join(workspaceDirPath, symlinkName);
      await fs.symlink(symlinkPath, targetPath);
    }

    for (index in dirPathArray) {
      await createSymbolLink(
        newWorkspaceDirPath,
        symlinkNameArray[index],
        dirPathArray[index],
      );
    }
    const newWorkspaceConfig = {
      name,
      content: dirPathArray.map((dirPath, index) => {
        return {
          name: symlinkNameArray[index],
          dirPath,
        };
      }),
    };
    data.workspaceConfig[name] = newWorkspaceConfig;
  }

  async function pluginInit() {
    try {
      const neovimDataPath = await getNeovimDataPath();
      console.log("neovimDataPath", neovimDataPath);
      const workspacePath = await getWorkspacePath(neovimDataPath);
      console.log("workspacePath", workspacePath);
      const workspaceConfig = await getWorkspaceConfig(workspacePath);
      console.log("workspaceConfig", workspaceConfig);
      data.workspacePath = workspacePath;
      data.workspaceConfig = workspaceConfig;
    } catch (err) {
      console.error(err);
    }
  }

  plugin.registerCommand("WorkspacePluginInit", pluginInit, { sync: false });
};
