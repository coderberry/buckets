module DistributionPlansHelper
  
  def add_detail_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :details, :partial => 'detail', :object => DistributionPlanDetail.new
    end
  end
  
end
