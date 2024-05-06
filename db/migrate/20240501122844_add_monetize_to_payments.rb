class AddMonetizeToPayments < ActiveRecord::Migration[7.1]
  def change
    add_monetize :payments,:sub_total,amount:{null:true,default:nil},currency:{null:true,default:nil}
    add_monetize :payments,:discount,amount:{null:true,default:nil},currency:{null:true,default:nil}
    add_monetize :payments,:total_amount,amount:{null:true,default:nil},currency:{null:true,default:nil}
  end
end
