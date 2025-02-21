require 'httparty'
require 'mechanize'

puts "Hello World!"

# response = HTTParty.get('https://hac.coppellisd.com/HomeAccess/Account/LogOn?ReturnUrl=%2fHomeAccess')
# puts response.body

agent = Mechanize.new
page = agent.get('https://hac.coppellisd.com/HomeAccess/Account/LogOn?ReturnUrl=%2fHomeAccess')

form = page.forms[0]

form['LogOnDetails.UserName'] = 'txk4714'
form['LogOnDetails.Password'] = 'Java64714'

new_page = form.submit

iframe = new_page.at('iframe#sg-legacy-iframe')

assignment_src = iframe['src']

assignment_page = agent.get(assignment_src).body

puts assignment_page