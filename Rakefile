task default: %w[push]

task :push do
  sh 'git add .'
  sh "git commit -m 'Update #{Time.now}.'"
  sh 'git push origin main'
end