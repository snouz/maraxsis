require 'lib.lib'

h2o.TRENCH_SURFACE_NAME = 'h2o-trench'
h2o.MARAXIS_SURFACE_NAME = 'h2o-maraxsis'

local prototypes = {
    [h2o.MARAXIS_SURFACE_NAME] = require 'scripts.map-gen.surfaces.maraxsis',
    [h2o.TRENCH_SURFACE_NAME] = require 'scripts.map-gen.surfaces.maraxsis-trench',
}

for _, prototype in pairs(prototypes) do
    local as_array = {}
    local i = 1
    for noise_layer, setting in pairs(prototype.noise_layers) do
        if not setting.cellular then
            as_array[i] = noise_layer
            i = i + 1
        end
    end
    prototype.noise_layers_as_array = as_array
end

h2o.prototypes = prototypes

require 'scripts.submarine'
require 'scripts.map-gen.map-gen'

h2o.finalize_events()