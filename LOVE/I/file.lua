--用来格式化数据位字符串
function serialize (o)
    local str=""
    if type(o) == "number" then

       str=str..o

    elseif type(o) == "string" then

       str=str..string.format("%q", o)

    elseif type(o) == "table" then

      str=str.."{\n"

       for k,v in pairs(o) do

           str=str.." "..k.. " = "

           str=str..serialize(v)

           str=str..",\n"

       end

       str=str.."}\n"

    else

       error("cannot serialize a " .. type(o))

    end
    return str
end
--存储，file文件名，name表名，o要存的表
function save(file,name,o)
    local f=io.open(file,"a")
    f:write(name,"=")
    f:write(serialize(o))
    f:close()
end

--修改,filename文件名,name表名，arg表里的索引，value索引arg要修改的值,isStr表示value是否为字符串默认为假
function edit(filename,name,arg,value,isStr)

    local f=assert(io.open(filename,"r"))
    local str=""
    isStr=isStr or false
    for line in f:lines() do
        if string.find(line,"%s*"..arg.." =") then --匹配以空白开头并以" ="结尾的字符串，即索引，可以打开sav.lua一看
        if isStr then
            line=string.gsub(line,"=.*","= \""..value.."\",") --匹配以"="开头的字符串，即值
        else
            line=string.gsub(line,"=.*","= "..value..",")
        end
        str=str..line.."\n"

        else
        str=str..line.."\n"

        end
    end

    f:close()
    local f2=io.open("tmp.lua","w")
    f2:write(str)
    f2:close()
    os.remove(filename)
    os.rename("tmp.lua",filename)

end

A={a=1,b=2,c="wuji"}
--保存时的表名不要与先在的表名相同
save("sav.lua","A1",A)
--使用dofile加载，require只加载一次
dofile("sav.lua")
print(A1.c) --wuji
edit("sav.lua","A1","c","banshan",true) --修改为c为banshan
dofile("sav.lua")
print(A1.c)--banshan
edit("sav.lua","A1","b","5") --修改b为5
dofile("sav.lua")
print(A1.b) --5