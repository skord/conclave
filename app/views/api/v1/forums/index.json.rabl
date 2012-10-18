collection @forums
node :urls do
   {
    api: url_for(controller: 'api/v1/forums', action: 'index', host: request.env['SERVER_NAME']),
    public: url_for(controller: 'forums', action: 'index', host: request.env['SERVER_NAME'])
   }
end
extends "api/v1/forums/show"