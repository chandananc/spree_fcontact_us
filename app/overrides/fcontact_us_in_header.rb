Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "fcontact_us_in_header",
                     :insert_bottom => "#main-nav-bar .nav.navbar-nav:first-child",
                     :text => "<li class='<%= (request.fullpath.gsub('//','/') == '/fcontact-us') ? 'active' : ''%>'><%= link_to Spree.t(:fcontact_us_title), '/fcontact-us'  %></li>",
                     :original => '442eefbb91b46a8773ce1de620f8f0a88a66caf1')