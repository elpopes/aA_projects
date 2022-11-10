def my_reject(array, &blc)
    array.select {|ele| !blc.call(ele)}
end

def my_one?(array, &blc)

    1 == array.count {|ele| blc.call(ele)}
end 

def hash_select(hash, &blc)
    hash.reject {|k,v| !blc.call(k,v)}
end

def xor_select(hash, prc1, prc2)
    hash.select {|ele| prc1.call(ele) && !prc2.call(ele) || !prc1.call(ele) && prc2.call(ele) } 
end

def proc_count(value, prcs_array)
    prcs_array.count {|prc| prc.call(value)}  
end