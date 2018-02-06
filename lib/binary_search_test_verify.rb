require './binary_search_test'

p [0,1,2,3,4].my_bsearch(true) {|x| 0-x}
p [0,1,2,3,4].my_bsearch(true) {|x| 1-x}
p [0,1,2,3,4].my_bsearch(true) {|x| 2-x}
p [0,1,2,3,4].my_bsearch(true) {|x| 3-x}
p [0,1,2,3,4].my_bsearch(true) {|x| 4-x}

p [1,3,5,10,20,100].my_bsearch(true) {|x| 6-x}

