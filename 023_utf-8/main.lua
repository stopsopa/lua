-- characters: https://www.charset.org/utf-8
-- a
-- 5
-- 19988	U+4E14	E4 B8 94	且	
-- 19976	U+4E08	E4 B8 88	丈	
-- 69970	U+11152	F0 91 85 92	𑅒	Mahajani Letter U
-- 68206	U+10A6E	F0 90 A9 AE	𐩮	Old South Arabian Letter Sadhe
-- 94001	U+16F31	F0 96 BC B1	𖼱	Miao Letter Yi Dzha
-- z
s = 'a5且丈𑅒𐩮𖼱z'

naive = string.gsub(s, ".", function(p)
    return '>' .. p .. '<';
end)

print('naive', naive)

-- https://stopsopa.github.io/lua/ebook.pdf page 89
better = string.gsub(s, utf8.charpattern, function(p)
    return '>' .. p .. '<';
end)

print('better', better)

