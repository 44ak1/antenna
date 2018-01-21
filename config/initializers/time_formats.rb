Time::DATE_FORMATS[:human] = lambda {|date|
  seconds = (Time.now - date).round;
  days    = seconds / (60 * 60 * 24); return "#{days}日前" if days > 0;
  hours   = seconds / (60 * 60);      return "#{hours}時間前" if hours > 0;
  minutes = seconds / 60;             return "#{minutes}分前" if minutes > 0;
  return "#{seconds}秒前"
}
