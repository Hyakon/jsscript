class Email < ApplicationRecord

    def index
        @emails = Email.all
    end
    
end
