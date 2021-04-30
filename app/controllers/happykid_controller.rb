class HappykidController < ApplicationController
  before_action :authenticate_user!, :except => [:home, :contact]
# https://nithinbekal.com/posts/rails-page-titles/ this is for title tags and descriptions




  def home
    @happykid = OpeningTime.all
    @promo = Promo.all
    @news = News.all

    @meta = News.last

    @siteinfo = SiteInfo.all
   
  end

  def contact
    @meta = OpeningTime.find_by(id: 2) 

    
  end

  def news
    @newsitem = Promo.find_by(title: params[:id].gsub('-',' '))
    @meta = @newsitem
    

  end 

  def happening
    @newsitem = News.find_by(title: params[:id].gsub('-',' '))
    @meta = @newsitem
    

  end


                    ################  OPENING TIMES START HERE #####################
# Open admin page
  def admin
    @happykid = OpeningTime.all
    @promo = Promo.all
    @news = News.all
    @siteInfo = SiteInfo.all
    @staff = Staff.all
  end

# Open page to add nwe opening time
  def addtime
    
  end

# post request to create a new opening time
  def maketime

    openingtime = OpeningTime.new do |u|
      u.day = params[:opening_times][:day]
      u.from = "9:00"
      u.to = "12 Noon"
      u.on = true
      u.position = params[:opening_times][:position]
      
      
    end
    openingtime.save
    redirect_to "/"
  end

# Get request to open edit opening time page
    def edittime
        @nox = params[:id]
        @dday = OpeningTime.find_by(id: params[:id]) 

          @day = @dday.day
          @to = @dday.to
          @from = @dday.from
          @on = @dday.on
          @position = @dday.position


    end

# Post request to update opening time 
    def changetime

      @order = OpeningTime.find_by(id: params[:id])
      @order.update_attribute(:from , params[:opening_times][:from])
      @order.update_attribute(:to , params[:opening_times][:to])
      @order.update_attribute(:on , params[:opening_times][:on])
      @order.update_attribute(:day , params[:opening_times][:day])
      @order.update_attribute(:position , params[:opening_times][:position])
          
    redirect_to "/admin"
    end


# Get request to delete opening time 
        def deletetime
            OpeningTime.find(params[:id]).destroy
            redirect_to "/admin"
        end



         ################  OPENING TIMES END HERE #####################
         
         
         
         ############################# gallery functions

def gallery
  
  @gallery = Picture.all

end

def newImage
  
  
   galimage = Picture.new do |u|
             # u.image = params[:galleryim][:name]
              u.description = params[:galleryim][:description]
              u.alt = params[:galleryim][:atttext]
              u.image = params[:galleryim][:thepic].original_filename
              
              
              tmp = params[:galleryim][:thepic].tempfile
    #require 'ftools'
    file = File.join("app/assets/images", params[:galleryim][:thepic].original_filename) # use public if you want
  FileUtils.cp tmp.path, file
  end
  
  galimage.save
   redirect_to "/gallery"
end


   def deletegallery
            Picture.find(params[:id]).destroy
            redirect_to "/admin"
        end

############################# End gallery
         
         
         

############# staff controller

def staff
  @meta = "All Staff Stuff"
  @staff = Staff.all
end 


def addstaff
  
end

       def deletestaff
            Staff.find(params[:id]).destroy
            redirect_to "/admin"
        end

def singlestaff
  
   @staff = Staff.find_by(name: params[:id].gsub('-',' '))
    @meta = @staff
  
end

def editstaff
  
      @newsx = params[:id]
        @newsf = Staff.find_by(id: params[:id]) 

          @name = @newsf.name
          @description = @newsf.description
          @image = @newsf.image
          @id = @newsf.id
          
       
  
end


def changestaff
    @staff = Staff.find_by(id: params[:id])
      @staff.update_attribute(:name , params[:staff][:name])
      @staff.update_attribute(:description , params[:staff][:description])
     #  @staff.update_attribute(:to , params[:staff][:image])
     
          
    redirect_to "/admin"
  
end


       def makestaff

            staff = Staff.new do |u|
              u.name = params[:staff][:name]
              u.description = params[:staff][:description]
              u.image = params[:staff][:image].original_filename
              
             
              

tmp = params[:staff][:image].tempfile
    #require 'ftools'
    file = File.join("app/assets/images", params[:staff][:image].original_filename) # use public if you want
  FileUtils.cp tmp.path, file

  
            end
            staff.save
            redirect_to "/admin"
          end


def editstaffimage
  @staffx = params[:id]
  @stafff = Staff.find_by(id: params[:id]) 

    @name = @stafff.name
  
    @image = @stafff.image

    
end

# A url to change videos  
def changestaffimage
  @staff = Staff.find_by(id: params[:id])
  @staff.update_attribute(:image , params[:staff][:image].original_filename)
  
  
  
  tmp = params[:staff][:image].tempfile
    #require 'ftools'
    file = File.join("app/assets/images", params[:staff][:image].original_filename) # use public if you want
  FileUtils.cp tmp.path, file
  
  
  redirect_to "/admin"
end




############ end staff controls



          ################  PROMO DETAILS START HERE #####################
# Open page to add new promo

      def addpromo
          
      end

# post request to create a new promoton
          def makepromo

            promo = Promo.new do |u|
              u.title = params[:promo][:title]
              u.description = params[:promo][:description]
              u.image1 = params[:promo][:image1x].original_filename
              u.image2 = params[:promo][:image2x].original_filename
              u.position = params[:promo][:position]
              u.on = params[:promo][:on]
              
              

tmp = params[:promo][:image1x].tempfile
    #require 'ftools'
    file = File.join("app/assets/images", params[:promo][:image1x].original_filename) # use public if you want
  FileUtils.cp tmp.path, file

  tmp2 = params[:promo][:image2x].tempfile
  #require 'ftools'
  file = File.join("app/assets/images", params[:promo][:image2x].original_filename) # use public if you want
FileUtils.cp tmp2.path, file
            end
            promo.save
            redirect_to "/admin"
          end


# Get request to open edit promo page
            def editpromo
              @promox = params[:id]
              @promof = Promo.find_by(id: params[:id]) 

                @title = @promof.title
                @description = @promof.description
                @image1 = @promof.image1
                @image2 = @promof.image2
                @on = @promof.on
                @position = @promof.position


            end



# Post request to update promo
def changepromo

  @promo = Promo.find_by(id: params[:id])
  @promo.update_attribute(:title , params[:promo][:title])
  @promo.update_attribute(:description , params[:promo][:description])
  @promo.update_attribute(:image1 , params[:promo][:image1])
  @promo.update_attribute(:image2 , params[:promo][:image2])
  @promo.update_attribute(:position , params[:promo][:position])
  @promo.update_attribute(:on , params[:promo][:on])
      
redirect_to "/admin"
end

#### Delete promo

def deletepromo
  Promo.find(params[:id]).destroy
  redirect_to "/admin"
end

          ################  PROMO DETAILS END HERE #####################

          ################  news DETAILS START HERE #####################
# Open page to add new promo

def addnews
          
end

# post request to create a new promoton
    def makenews

      news = News.new do |u|
        u.title = params[:news][:title]
        u.description = params[:news][:description]
        u.image1 = params[:news][:image1x].original_filename
        u.image2 = params[:news][:image2x].original_filename
        u.position = params[:news][:position]
        u.on = true
        u.video = params[:news][:video]
        

        tmp = params[:news][:image1x].tempfile
    #require 'ftools'
    file = File.join("app/assets/images", params[:news][:image1x].original_filename) # use public if you want
  FileUtils.cp tmp.path, file

  tmp2 = params[:news][:image2x].tempfile
  #require 'ftools'
  file = File.join("app/assets/images", params[:news][:image2x].original_filename) # use public if you want
FileUtils.cp tmp2.path, file
        
      end
      news.save
      redirect_to "/admin"
    end


# Get request to open edit promo page
      def editnews
        @newsx = params[:id]
        @newsf = News.find_by(id: params[:id]) 

          @title = @newsf.title
          @description = @newsf.description
          @image1 = @newsf.image1
          @image2 = @newsf.image2
          @on = @newsf.on
          @position = @newsf.position
          @video = @newsf.video

          
      end

    

# Post request to update promo
def changenews

@news = News.find_by(id: params[:id])
@news.update_attribute(:title , params[:news][:title])
@news.update_attribute(:description , params[:news][:description])
@news.update_attribute(:image1 , params[:news][:image1])
@news.update_attribute(:image2 , params[:news][:image2])
@news.update_attribute(:position , params[:news][:position])
@news.update_attribute(:on , params[:news][:on])
#@news.update_attribute(:video , params[:news][:whyted])

params.permit(:video)
#tmp = params[:news][:picturexxx].tempfile
    #require 'ftools'
 #   file = File.join("app/assets/images", params[:news][:picturexxx].original_f  ilename) # use public if you want
  #  FileUtils.cp tmp.path, file
  
    
  


redirect_to "/admin"
end



# get change video page

def editnewsvid
  @newsx = params[:id]
  @newsf = News.find_by(id: params[:id]) 

    @title = @newsf.title
  
    @video = @newsf.video

    
end

# A url to change videos  
def changenewsvideo
  @news = News.find_by(id: params[:id])
  @news.update_attribute(:video , params[:news][:whyted])
  redirect_to "/admin"
end


# Get request to delete opening time 
def deletenews
  News.find(params[:id]).destroy
  redirect_to "/admin"
end


    ################  News DETAILS END HERE #####################

def savevid
  tmp = params[:vids][:video].tempfile
  #require 'ftools'
  file = File.join("app/assets/videos", params[:vids][:video].original_filename) # use public if you want
  FileUtils.cp tmp.path, file

  redirect_to "/admin"
end


########### Website Info Starts Here

# get request to render page
def addinfo

end



# post request to create a new promoton
def makeinfo

  info = SiteInfo.new do |u|
    u.title = params[:info][:title]
    u.subtitle = params[:info][:subtitle]
    u.description = params[:info][:description]
    u.image = params[:info][:image]
    u.image2 = params[:info][:image2]
    u.position = params[:info][:position]
    
    
    
  end
  info.save
  redirect_to "/admin"
end

# get request to render page
def editinfo
  @newsx = params[:id]
  @newsf = SiteInfo.find_by(id: params[:id]) 

    @title = @newsf.title
    @subtitle = @newsf.subtitle
    @description = @newsf.description
    @image = @newsf.image
    @image2 = @newsf.image2
    @position = @newsf.position


end


########### Website info ends here 

def changeinfo

  @news = SiteInfo.find_by(id: params[:id])
  @news.update_attribute(:title , params[:news][:title])
  @news.update_attribute(:subtitle , params[:news][:subtitle])
  @news.update_attribute(:description , params[:news][:description])
  @news.update_attribute(:image , params[:news][:image])
  @news.update_attribute(:image2 , params[:news][:image2])
  @news.update_attribute(:position , params[:news][:position])
  
  #tmp = params[:news][:picturexxx].tempfile
    #require 'ftools'
   # file = File.join("app/assets/images", params[:news][:picturexxx].original_filename) # use public if you want
    #FileUtils.cp tmp.path, file


  redirect_to "/admin"
  end
  
  
  
  
  # Get request to delete opening time 
  def deletinfo
    SiteInfo.find(params[:id]).destroy
    redirect_to "/admin"
  end
  



  ###################################### mail
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    
    if @contact.save
      ContactsMailer.general_message(@contact).deliver
      render :thanks
    else
      render :new
    end
  end
  
  def thanks
  end
###################################### mail

private 

def news_params
  params.require(:news).permit(:video)
end





end
