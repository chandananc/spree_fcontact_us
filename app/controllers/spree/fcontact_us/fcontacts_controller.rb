class Spree::FcontactUs::FcontactsController < Spree::StoreController

  helper "spree/products"
  def create
    @fcontact = Spree::FcontactUs::Fcontact.new(params[:fcontact_us_fcontact])

    if @fcontact.save
      if Spree::FcontactUs::Config.fcontact_tracking_message.present?
        flash[:fcontact_tracking] = Spree::FcontactUs::Config.fcontact_tracking_message
      end
      redirect_to(spree.root_path, :notice => Spree.t('fcontact_us.notices.success'))
    else
      render :new
    end
  end

  def new
    @fcontact = Spree::FcontactUs::Fcontact.new
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  private

  def accurate_title
    Spree.t(:fcontact_us_title)
  end

end