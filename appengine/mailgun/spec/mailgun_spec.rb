# Copyright 2016 Google, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require File.expand_path("../../../../spec/e2e", __FILE__)
require "rspec"
require "capybara/rspec"
require "capybara/poltergeist"

Capybara.current_driver = :poltergeist

RSpec.describe "MailGun on Google App Engine", type: :feature do
  before :all do
    @url = E2E.url
  end

  it "can send email" do
    visit @url

    within "#plaintext" do
      fill_in "recipient", with: "recipient@example.com"
      click_button "Send email"
    end

    # Mailgun::CommunicationError was successully caught and rendered
    expect(page).to have_content "Email failed to send"
  end
end