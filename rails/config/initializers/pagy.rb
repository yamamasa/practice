require 'pagy/extras/headers'
require 'pagy/extras/support'
require 'pagy/extras/items'

# default items
Pagy::VARS[:items] = 20

# extra items

Pagy::VARS[:enable_items_extra] = true
Pagy::VARS[:max_items] = 100
