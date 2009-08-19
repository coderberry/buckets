module BucketsHelper
  
  def add_bucket_link(name, account_id)
    account = Account.find(account_id)
    link_to_function name do |page|
      page.insert_html :after, "paycheck_amounts_#{account.id}", :partial => 'bucket_row', :object => Bucket.new, :locals => { :account => account }
      page.visual_effect :highlight, "bucket_row_#{account.id}-"
      page << "document.getElementById('bucket_name_#{account.id}-').focus();"
    end
  end
  
end
