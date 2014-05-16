class Idea < ActiveRecord::Base
	belongs_to :user

	#after_create :send_sms

	# def send_sms
 #    $client.account.messages.create(
 #      :from => '+14378000532',
 #      :to => '+16477025165',
 #      :body => @idea.description
 #    )
 #  	end
end
