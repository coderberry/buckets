module PaychecksHelper
  
  def add_paycheck_to_account_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :paycheck_to_account, :partial => 'paycheck_to_account', :object => PaycheckToAccount.new
    end
  end
  
end
