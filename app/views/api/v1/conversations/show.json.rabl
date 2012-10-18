object @conversation
attributes :id, :title, :comments_count, :created_at, :updated_at, :forum_id

node :urls do |conversation|
   {
    api: url_for(controller: 'api/v1/forums', action: 'show', host: request.env['SERVER_NAME'], id: conversation.id),
    public: url_for(controller: 'forums', action: 'show', host: request.env['SERVER_NAME'], id: conversation.id)
   }
end

child :comments do
  attributes :id, :content, :created_at, :updated_at, :redacted, :redacted_at
end