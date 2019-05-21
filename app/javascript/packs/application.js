import "bootstrap";
import $ from 'jquery'
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { popoverInit } from './popovers'
import { lightpickInitVehicleIndex } from '../plugins/init_lightpick'

initAutocomplete();
initMapbox();

lightpickInitVehicleIndex();
popoverInit();
