const path = require("node:path");
const fs = require("node:fs/promises");

function pluginContext(plugin, pluginCore) {
  const data = {};

  console.log = (...args) => {
    plugin.nvim.outWrite(args.join(" ") + "\n");
  };

  console.error = (...args) => {
    plugin.nvim.errWrite(args.join(" ") + "\n");
  };

  return pluginCore(ctx);
}

module.exports = pluginContext(plugin, (ctx) => {
  const _getNvimStdDataPath = async (ctx) => {
    try {
      return await ctx.plugin.nvim.request("nvim_exec_lua", [
        'return vim.fn.stdpath("data")',
        [],
      ]);
    } catch (err) {
      console.error(err);
      return;
    }
  };
  const _getWorkspacePluginDataPath = async (ctx) => {
    try {
      const nvimStdDataPath = await _getNvimStdDataPath(ctx);
      const workspacePluginDataPath = path.join(nvimStdDataPath, "workspace");
      try {
        const stat = await fs.stat(workspacePluginDataPath);
        if (stat.isDirectory()) {
          return workspacePluginDataPath;
        } else {
          throw new Erorr(
            `Path ${workspacePluginDataPath} exists but is not a directory.`,
          );
        }
      } catch (err) {
        if (err.code === "ENOENT") {
          await fs.mkdir(workspacePluginDataPath, { recursive: true });
          return workspacePluginDataPath;
        }
        throw err;
      }
    } catch (err) {
      console.error(err);
      throw err;
    }
  };
  const _getWorkspacePluginConfigJsonPath = async (ctx) => {
    const workspacePluginDataPath = await _getWorkspacePluginDataPath(ctx);
    const workspacePluginConfigJsonPath = path.join(
      workspacePluginDataPath,
      "config.json",
    );
    try {
      const stat = await fs.stat(workspacePluginConfigJsonPath);
      if (stat.isFile()) {
        return workspacePluginConfigJsonPath;
      } else {
        throw new Erorr(
          `Path ${workspacePluginConfigJsonPath} exists but is not a file.`,
        );
      }
    } catch (err) {
      if (err.code === "ENOENT") {
        await fs.writeFile(workspacePluginConfigJsonPath, "");
        return workspacePluginConfigJsonPath;
      }
      throw err;
    }
  };

  // TODO: 对Workspace进行更改，实时读取并更新的方式处理。

  // 封装一些基本操作，例如创建Workspace，进入Workspace，往Workspace添加目录等。

  const cmdWorkspacePluginInit = () => {};
  const cmdWorkspaceCreate = () => {};
  const cmdWorkspaceAddDirectory = () => {};
  const cmdWorkspaceRemoveDirectory = () => {};
  const cmdWorkspaceGoto = () => {};
  const cmdWorkspaceList = () => {};

  ctx.plugin.registerCommand("WorkspacePluginInit", cmdWorkspacePluginInit, {
    sync: false,
  });
  ctx.plugin.registerCommand("WorkspaceCreate", cmdWorkspaceCreate, {
    sync: false,
  });
  ctx.plugin.registerCommand(
    "WorkspaceAddDirectory",
    cmdWorkspaceAddDirectory,
    { sync: false },
  );
  ctx.plugin.registerCommand(
    "WorkspaceRemoveDirectory",
    cmdWorkspaceRemoveDirectory,
    { sync: false },
  );
  ctx.plugin.registerCommand("WorkspaceGoto", cmdWorkspaceGoto, {
    sync: false,
  });
  ctx.plugin.registerCommand("WorkspaceList", cmdWorkspaceList, {
    sync: false,
  });
});
