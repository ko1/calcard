require 'ferrum'
ENV['BROWSER_PATH'] = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'

path = "file:///#{Dir.pwd}/calcard.html"
sizes = [
  # iphone
  [320, 480],
  [640, 960],
  [640, 1136],
  [750, 1334],
  [1080, 2340],
  [1242, 2208],
  [1125, 2436],
  [828, 1792],
  [1170, 2532],
  [1242, 2688],
  [1284, 2778],

  # pc
  [1024, 768],
  [1920, 1080],
  [2560, 1440],
]

f = open("doc/screenshots.md", 'w')
f.puts("# Screenshots on different resolutions")
(sizes + sizes.map{|w, h| [h, w]}).each do |w, h|
  browser = Ferrum::Browser.new(window_size: [w, h])
  browser.go_to(path)
  ss_file = "capture_#{w}_#{h}.png"
  browser.screenshot(path: 'doc/' + ss_file)
  browser.quit

  f.puts "## #{w}x#{h}"
  f.puts "![#{w}x#{h}](./#{ss_file})"
  f.puts
end
