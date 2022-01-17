class Admin::BaseController < ApplicationController

    def full_name
        self.first_name + self.family_name
    end

    def full_name_kana
        self.first_name_kana + self.family_name_kana
    end

end
