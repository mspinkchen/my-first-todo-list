class Item < ApplicationRecord
  validates_presence_of :content, :due_date
  

#判斷是否能夠刪除
#如果沒有過期，則回傳 true = 可以刪除 
def can_destroy?
  !overdue?
end



#如果due_date比今天小，則回傳 true = 過期
def overdue?
  due_date < Date.today
end

end
