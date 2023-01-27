local M = {}

function ends_with(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

function is_test_file(filename)
  return ends_with(filename, "_test.rb")
end

function test_to_code(filename)
  return "fooooo.rb"
end

function code_to_test(code_filename)
  -- TODO: View tests
  
  local test_filename = string.gsub(code_filename, ".rb$", "_test.rb")

  return test_filename
end

function related_from(filename)
  if is_test_file(filename) then
    return test_to_code(filename)
  else
    return code_to_test(filename)
  end
end

function M.call()
  local filename = vim.api.nvim_buf_get_name(0)

  local related_filename = related_from(filename)

  --print("G2t: " .. filename .. " - " .. related_filename)
  return "G2t: " .. filename .. " - " .. related_filename


  --print("EHLO WORLD!!! <<<<<<<<<<" .. filename .. "<<<<<<<<<<<<<<<<<<<<<")
  -- local results = {}
  -- local buffers = vim.api.nvim_list_bufs()
  --
  -- for _, buffer in ipairs(buffers) do
  --   if vim.api.nvim_buf_is_loaded(buffer) then
  --     local filename = vim.api.nvim_buf_get_name(buffer)
  --     table.insert(results, filename)
  --   end
  -- end
  --
  -- vim.ui.select(results, { prompt = "Find buffer:" }, function(selected)
  --   if selected then
  --     vim.api.nvim_command("buffer " .. selected)
  --   end
  -- end)
end

return M
