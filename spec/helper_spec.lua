describe("Test the helper methods #helper", function()
    lazy_setup(function()
        require("faketorio.helper")
        os.remove(".faketorio")
    end)

    after_each(function()
        os.remove(".faketorio")
    end)

    it("should fail to load config file if not present.", function()
        assert.has_error(function() faketorio.load_config() end)
    end)

    it("should read config if file is present.", function()
        local file = io.open(".faketorio", "w")
        file:write("factorio_run_path = D:\\Spiele\\Factorio\\bin\\x64\\factorio.exe\n")
        file:write("factorio_mod_path = C:\\Users\\jonas\\AppData\\Roaming\\Factorio\\mods")
        file:close()

        faketorio.load_config()

        assert.are.equals("D:\\Spiele\\Factorio\\bin\\x64\\factorio.exe", faketorio.factorio_run_path)
        assert.are.equals("C:\\Users\\jonas\\AppData\\Roaming\\Factorio\\mods", faketorio.factorio_mod_path)
    end)
end)
