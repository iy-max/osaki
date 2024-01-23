-- Take in svg content with an existing format string
-- and replace the single instance with the specified color
-- Could technically take a table for colors instead of string
-- In case more format strings are given
-- We can leave that as a TODO if necessary
return function(svg, color)
    return string.format(svg, color)
end