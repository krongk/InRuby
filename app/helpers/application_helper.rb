# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #[ ["index"],["about"],["career"],["client"],["contact"],["help"],["product"],["project"],["service"],["skill"] ]
  CATEGORY=[ ["index"],["about"],["career"],["client"],["contact"],["help"],["product"],["project"],["service"],["skill"] ]
  def format_date(date)
    if date.is_a?(DateTime)
       date.strftime("%Y-%m-%d %H:%M")
    end
  end
  #不知道干什么用的
   def show_locale_files
    output = ''
    Dir["#{LOCALES_DIRECTORY}#{I18n.locale}.{rb,yml}"].sort.each do |locale_file|
      output << "\n#{locale_file.sub(RAILS_ROOT + "/", "")}:\n\n"
      counter, lineWidth = 1, 80
      lines = *open(locale_file).map(&:rstrip).each do |line|
        output << "#{sprintf('%3d', counter)}: #{line}\n"
        counter += 1
      end
    end
    output
  end
end
