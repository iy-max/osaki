-- SVG CONTENTS AS FORMAT STRINGS -- 
-- If any svgs need to have their color changed, find the SVG's hex color value
-- and replace it for a %s to be able to use it with the helper function format-image.lua
local icons_format_strings = {}

icons_format_strings.browser = '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\
<!-- Uploaded to: SVG Repo, www.svgrepo.com, Transformed by: SVG Repo Mixer Tools -->\
<svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#FC5185" stroke-width="1.56">\
<g id="SVGRepo_bgCarrier" stroke-width="0"/>\
<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="0.048"/>\
<g id="SVGRepo_iconCarrier">\
<path d="M4.25016 16.5788C3.4559 15.2374 3 13.6719 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21C9.54777 21 7.32461 20.0193 5.70135 18.4286L13.4761 13.7256L17.4448 7.10059L10.6011 10.7256L7.39795 15.3975" stroke="%s" stroke-linecap="round" stroke-linejoin="round"/>\
</g>\
</svg>'

icons_format_strings.code = '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\
<svg width="800px" height="800px" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" fill="%s">\
<g id="SVGRepo_bgCarrier" stroke-width="0"/>\
<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>\
<g id="SVGRepo_iconCarrier"> <title>code-solid</title> <g id="Layer_2" data-name="Layer 2"> <g id="invisible_box" data-name="invisible box"> <rect width="48" height="48" fill="none"/> </g> <g id="icons_Q2" data-name="icons Q2"> <path d="M20,40h-.5a2,2,0,0,1-1.4-2.5l8-27.9a2,2,0,0,1,3.8,1l-8,28A1.9,1.9,0,0,1,20,40Z"/> <path d="M14,35a2,2,0,0,0,1.3-3.5L7,24l8.3-7.5a2,2,0,0,0-2.6-3l-10,9a2,2,0,0,0,0,3l10,9A1.9,1.9,0,0,0,14,35Z"/> <path d="M34,35a2,2,0,0,1-1.3-3.5L41,24l-8.3-7.5a2,2,0,1,1,2.6-3l10,9a2,2,0,0,1,0,3l-10,9A1.9,1.9,0,0,1,34,35Z"/> </g> </g> </g>\
</svg>'

icons_format_strings.music = '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\
<svg fill="%s" width="800px" height="800px" viewBox="-5.5 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">\
<g id="SVGRepo_bgCarrier" stroke-width="0"/>\
<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>\
<g id="SVGRepo_iconCarrier"> <title>music</title> <path d="M5.688 9.656v10.906c-0.469-0.125-0.969-0.219-1.406-0.219-1 0-2.031 0.344-2.875 0.906s-1.406 1.469-1.406 2.531c0 1.125 0.563 1.969 1.406 2.531s1.875 0.875 2.875 0.875c0.938 0 2-0.313 2.844-0.875s1.375-1.406 1.375-2.531v-11.438l9.531-2.719v7.531c-0.438-0.125-0.969-0.188-1.438-0.188-0.969 0-2.031 0.281-2.875 0.844s-1.375 1.469-1.375 2.531c0 1.125 0.531 2 1.375 2.531 0.844 0.563 1.906 0.906 2.875 0.906 0.938 0 2.031-0.344 2.875-0.906 0.875-0.531 1.406-1.406 1.406-2.531v-14.406c0-0.688-0.469-1.156-1.156-1.156-0.063 0-0.438 0.125-1.031 0.281-1.25 0.344-3.125 0.875-5.25 1.5-1.094 0.281-2.063 0.594-3.031 0.844-0.938 0.281-1.75 0.563-2.469 0.75-0.75 0.219-1.219 0.344-1.406 0.406-0.5 0.156-0.844 0.594-0.844 1.094z"/> </g>\
</svg>'

icons_format_strings.game = '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\
<svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">\
<g id="SVGRepo_bgCarrier" stroke-width="0"/>\
<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>\
<g id="SVGRepo_iconCarrier"> <path d="M6.00014 11H10.0001M8.00014 9V13M15.0001 12H15.0101M18.0001 10H18.0101M10.4491 5H13.5512C16.1761 5 17.4885 5 18.5187 5.49743C19.4257 5.9354 20.1793 6.63709 20.6808 7.51059C21.2503 8.5027 21.3438 9.81181 21.5309 12.43L21.7769 15.8745C21.8975 17.5634 20.5599 19 18.8667 19C18.0008 19 17.1796 18.6154 16.6253 17.9502L16.2501 17.5C15.907 17.0882 15.7354 16.8823 15.54 16.7159C15.1305 16.3672 14.6346 16.1349 14.1045 16.0436C13.8516 16 13.5836 16 13.0476 16H10.9527C10.4167 16 10.1487 16 9.89577 16.0436C9.36563 16.1349 8.86981 16.3672 8.46024 16.7159C8.26487 16.8823 8.09329 17.0882 7.75013 17.5L7.37497 17.9502C6.82064 18.6154 5.99949 19 5.13359 19C3.44037 19 2.10275 17.5634 2.22339 15.8745L2.46942 12.43C2.65644 9.81181 2.74994 8.5027 3.31951 7.51059C3.82098 6.63709 4.57458 5.9354 5.48159 5.49743C6.51176 5 7.8242 5 10.4491 5Z" stroke="%s" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </g>\
</svg>'

return icons_format_strings