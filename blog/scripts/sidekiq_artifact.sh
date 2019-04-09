#!/bin/bash
shopt -s extglob
set -e
# rm -rf circleci-poc-unicorn && rm -rf circleci-poc-sidekiq && rm -rf circleci-poc-cron
cp -r $CODEBUILD_SRC_DIR/blog circleci-poc-sidekiq

#For sidekiq related files
cd circleci-poc-sidekiq
rm -rf Gemfile Gemfile.lock vendor/* gemfile_for_unicorn gemfile_for_cron

mv gemfile_for_sidekiq Gemfile
cd app && rm -rf !(workers|models)
cd ../
rm -rf !(bin|app|Gemfile|config|db|log|scripts|vendor)
echo "sidekiq gem file"
echo $(cat Gemfile)
echo $(pwd)
echo $(ls)
bundle package && bundle install --gemfile Gemfile #&& bundle exec sidekiq -d -L log/sidekiq.log
exit 0
