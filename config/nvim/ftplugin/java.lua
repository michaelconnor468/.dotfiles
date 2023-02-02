local capabilities = require('config.lsp.handlers').capabilities
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local home = os.getenv 'HOME'

jdtls = require('jdtls')

if vim.fn.has 'mac' == 1 then
    CONFIG = 'mac'
elseif vim.fn.has 'unix' == 1 then
    CONFIG = 'linux'
end

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
    root_dir = vim.fn.getcwd()
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-jar',
        vim.fn.glob(home .. '/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        home .. '/.local/share/nvim/lsp_servers/jdtls/config_' .. CONFIG,
        '-data',
        home .. '/.local/share/nvim/lsp_servers/jdtls/data',
    },

    on_attach = require('config.lsp.handlers').on_attach,
    capabilities = capabilities,
    root_dir = root_dir,
    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = 'interactive',
                runtimes = {
                    {
                        name = 'JavaSE-17',
                        path = '/usr/lib/jvm/java-17-openjdk/',
                    },
                }
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = 'all',
                },
            },
            format = {
                enabled = false,
            },
        },
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                'org.junit.jupiter.api.Assertions.*',
                'org.mockito.Mockito.*',
            },
        },
        contentProvider = { preferred = 'fernflower' },
            extendedClientCapabilities = extendedClientCapabilities,
            sources = {
                organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
            useBlocks = true,
        },
    },

    flags = {
        allow_incremental_sync = true,
    },
}

jdtls.start_or_attach(config)
