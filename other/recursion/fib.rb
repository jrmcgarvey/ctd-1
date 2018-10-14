def fib_rec(i)
    if i==1 || i ==2
#      print 1.to_s + " "
       k=1
    else
       k=fib_rec(i-1) + fib_rec(i-2)
    end
#    print k.to_s + " "
    return k
end 


for i in 1..10
  print fib_rec(i).to_s + " "
end