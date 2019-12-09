# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

bundler install
rails s

config/routes.rb

app/controller
app/views

Các hàm auth  user_signed_in?  current_user  user_session
<%= @variable %>    dùng để hiển thị biến từ controller ra ngoài view
 render :template => '/users/customs/index'    dùng để return view
# Renders the template with a local variable (compact)
  render :template => "weblog/show", :locals => {:customer => Customer.new}
# Form 
      <%= form_with(url:'/users' , method: 'post') do |f| %>
 <div class="form-group">
          <%= f.label :Email %>
          <%= f.text_field :name, placeholder: "Enter your email", class: "form-control" %>
        </div>
<% end %>

f.text_field :name   tạo ra text area và nam="name" id="name"

#dd Hiển thị tham số có trong request
     abort params[:email].inspect
# title và @title -> giống let và var trong js


Làm phần hiển thị danh sách các món ăn bên trong nhà hàng
Hiển thị link

<% if condition    ? %>
<% else %>
<% end %>

<%= asset_path("restaurant2.jpg")%>

layout https://guides.rubyonrails.org/layouts_and_rendering.html
có dòng layout "inventory"



def testme
  respond_to do |format|
    msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
    format.json  { render :json => msg } # don't do msg.to_json
  end
end


Chọn nhiều nhà hàng  + thời gian -> ấn vào sẽ tạo ra 1 link trả về

Thêm order vào controller + generate link ra trả về luôn trong view đó - 
Nhớ so sánh thời gian kết thúc với thời gian hiện tại nữa  
Xử lý việc đăng nhập hay không