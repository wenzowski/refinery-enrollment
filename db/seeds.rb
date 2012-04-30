Refinery::User.all.each do |user|
  if user.plugins.where(:name => 'refinerycms_enrollment').blank?
    user.plugins.create(:name => "refinerycms_enrollment",
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(Refinery::User)

if defined?(Refinery::Page) and !Refinery::Page.exists?(:link_url => '/enrollment')
  page = Refinery::Page.create(
    :title => "Enrollment",
    :link_url => "/enrollment",
    :deletable => false,
    :menu_match => "^/enrollments?(\/|\/.+?|)$"
  )

  Refinery::Pages.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end
