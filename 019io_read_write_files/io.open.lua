-- https://stopsopa.github.io/lua/ebook.pdf page 53
val, err = io.open("/etc/passwd", "w");

print(val, err)
-- > nil /etc/passwd: Permission denied 13
