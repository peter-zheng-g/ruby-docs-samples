# Copyright 2018 Google, LLC
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

require_relative "../table_insert_rows"
require "spec_helper"

describe "Insert rows into a table" do
  before do
    @dataset = create_temp_dataset
    @table = @dataset.create_table "test_table" do |schema|
      schema.string  "name"
      schema.integer "value"
    end
  end

  example "Insert rows into a table" do
    output = capture { table_insert_rows @dataset.dataset_id, @table.table_id }

    expect(output).to include("successfully")
  end
end
