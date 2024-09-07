require('toggleterm').setup(
{
    size = 10,
    persist_size = true,
    insert_mappings = false,
    open_mapping = [[<C-j>]],
    direction = 'horizontal',
    shell = vim.o.shell,
}
)
