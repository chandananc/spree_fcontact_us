# If SpreeStaticContent extension is also being used we list a Fcontact Us link with the other footer page links.
Deface::Override.new(:virtual_path => "spree/shared/_footer",
                     :name => "fcontact_us_in_footer",
                     :insert_bottom => "#footer-pages ul",
                     :text => "<li class='<%= (request.fullpath.gsub('//','/') == '/fcontact-us') ? 'current' : 'not'%>'><%= link_to Spree.t(:fcontact_us_title), '/fcontact-us'  %></li>",
                     :original => '45ce7795da02814069b4c8421126cecb872df0d1')