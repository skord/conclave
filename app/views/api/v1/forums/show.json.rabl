object @forum
attributes :id, :title, :created_at, :updated_at, :conversations_count
node :urls do |forum|
   {
    api: url_for(controller: 'api/v1/forums', action: 'show', host: request.env['SERVER_NAME'], id: forum.id),
    public: url_for(controller: 'forums', action: 'show', host: request.env['SERVER_NAME'], id: forum.id)
   }
end