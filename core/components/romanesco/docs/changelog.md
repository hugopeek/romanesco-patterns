# Changelog for the Romanesco pattern library

## Romanesco Patterns 0.16.0
Released on March 29, 2020

New features:
- Add ability to create multi page forms
- Add social connect button for WhatsApp
- Add social share button for sharing URLs via email
- Add steps navigation to show the completion status of an activity
- Add TV input option for selecting a country (or countries)

Fixes and improvements:
- Load CSS/JS assets for modal, step and form components only if used on page
- Add ability to identify the last placeholder of splitString output
- Add TV to control save form option per form
- Remove Google+ elements
- Make sure spam submissions will also fail on 2nd attempt in forms
- Switch to fbFormReport for generating email messages
- Grab required form fields directly from CB properties array for validation
- Add field template for input options to form dropdowns and options
- Add multiple select option to form dropdowns
- Add option to center align buttons individually
- Call setUserPlaceholders cached in article overviews
- Improve layout and visibility of sharing widget in articleTraditional sidebar
- Make header backgrounds context sensitive in generated CSS
- Regenerate static CSS when changing a header background
- Fix timeline in project hub by referencing the correct classname

## Romanesco Patterns 0.15.3
Released on March 10, 2020

Fixes and improvements:
- Allow using a Global Background image without defining any crops
- Set higher event priority for generateStaticCSS plugin
- Prevent fatal error in jsonGetObject when JSON input is not present or invalid

## Romanesco Patterns 0.15.2
Released on March 3, 2020

Fixes and improvements:
- Add keyboard control to slider
- Switch to Swiper in Presentation template
- Use medium class instead of empty value for field sizes
- Don't initialize slider if there aren't enough slides
- Fix calculation of max thumb height in lazy load placeholders
- Fix lazy loading of images in slider
- Add system default setting for CB layout backgrounds
- Add non-white class to body if custom background is set

## Romanesco Patterns 0.15.1
Released on January 29, 2020

Fixes and improvements:
- Improve styling of off-canvas mobile menu
- Replace Slick slider with Swiper
- Move Overview pagination wrapper to chunk tpl

## Romanesco Patterns 0.15.0
Released on January 14, 2020

New features:
- Add layout for creating sliders with content elements
- Add template for creating presentations
- Add pagination with AJAX support
- Add lazy loading to Image CB and image overviews

Fixes and improvements:
- Rename slider classes to avoid collisions with new FUI slider module
- Convert new lines to line breaks in Quotes
- Add suffix with version number to main CSS and JS assets
- Optimize caching of chunks in Overview templates
- Generate responsive content images with srcset and sizes
- Add round and removeDuplicateLines snippets
- Use alias to specify ID in form template
- Use system setting to specify title format in head
- Manage background availability inside selectors
- Generate static CSS file with Global Backgrounds (per context if needed)
- Reference Global Backgrounds by template ID when loading custom CSS
- Add system settings for Mapbox username and style_id

## Romanesco Patterns 0.14.7
Released on December 17, 2019

New features:
- Add Date and Date Range fields to FormBlocks

Fixes and improvements:
- Fix special characters breaking FB option labels
- Optimize FormBlocks validation processing
- Improve inheritance of FormBlocks label position settings
- Load home breadcrumb with tpl chunk
- Fix structured data errors in breadcrumbs
- Fix illegal regex sequences

## Romanesco Patterns 0.14.6
Released on November 19, 2019

New features:
- Add jsonGetObject snippet for templating JSON output with chunks
- Add ability to center content when stacked on mobile or tablet
- Add circular button option
- Add circular and bordered image options

Fixes and improvements:
- Refactor Global Backgrounds component
- Add ability to search for multiple instances of key in jsonGetValue
- Fix fallback icon in avatar when an article has no author
- Fix memory exhausted issues when rebuilding content with ContentBlocks
- Fix visibility toggles in front-end pattern library
- Limit reverse column order setting to mobile only
- Rename InjectInvertedClasses plugin to ManipulateDOM
- Rename MarkdownMimeType plugin to ProcessMarkdown
- Remove rows from grids that have a reversed column order on mobile
- Remove .md extension from Markdown links and turn them into button if desired
- Add language class to Markdown code blocks that do not specify a language
- Turn Markdown tables into Semantic UI tables

## Romanesco Patterns 0.14.5
Released on October 12, 2019

Hotfix: forward missing prefix to setBoxTypeTheme snippet

## Romanesco Patterns 0.14.4
Released on October 10, 2019

New features:
- Integrate visual regression tests (with BackstopJS)
- Add snippet for creating static HTML file of resource
- Add responsive options to main layouts and overviews

Fixes and improvements:
- Fix incorrect syntax in Google webfont requests
- Define exact aspect ratio for Overview images
- Add inverted class to logo in vertical menu
- Fix image URLs and display size in Markdown output
- Mute rogue path output in manager for Redactor too
- Remove http:// in Youtube embed placeholder URL
- Update resourceTVInputOptions to respect possible context settings
- Fix broken avatar image in compact article overviews
- Fix incorrect path in CSS to global backgrounds SVG
- Correctly retrieve (possible) context setting for FormBlocks container ID
- Correctly retrieve (possible) context setting for CB and TV options
- Load full off-canvas navigation if main menu is not a dropdown menu

## Romanesco Patterns 0.14.3
Released on July 16, 2019

New features:
- Allow credits to be added to an image or icon
- Add Free variant to Overview images (no fixed aspect ratio)
- Add Commento as commenting option

Fixes and improvements:
- Isolate content images and increase the distance from element below
- Show top level parent in vertical sub navigation
- Add alignment option to all Overview CBs
- Add text_size, show_subtitle and show_rating options to Testimonial overviews
- Make overviewRowImageBasic template more basic
- Improve sorting in Overviews (reverse sort direction, alphabetic sort order)
- Add basic icon chunk
- Add tertiary button style (Fomantic UI feature)
- Add option to place button on new line
- Fix issue with rogue 0 output from getImageDimensions breaking SUI build
- Fix quirk where TVs couldn't be rendered in layouts anymore
- Prevent leaking of data from srcset placeholder in overview images
- Allow theme additions to global backgrounds
- Return after a setBoxType override was found
- Lower minimum width for all image TVs
- Apply img_quality configuration setting to all images
- Only load certain assets (CSS/JS) when they are needed
- Small caching optimizations in Overview templates
- Rename and refactor Knowledge Base into Notes
- Tickets integration is now deprecated


## Romanesco Patterns 0.14.2
Released on April 15, 2019

Fixes and improvements:
- Prevent MIGXdb fields with default value of NULL from being set to 0
- Allow otherwise duplicate TV category names to be prefixed with _ in projects
- Add option to embed Google Analytics with gtag.js
- Add option to embed Matomo Analytics
- Fix not being able to set image type in Publication and Portfolio overviews
- Fix binary download types (such as PDFs) not having content
- Fix Global Backgrounds TV not loading its MIGX config from file
- Use nvm-exec to run Gulp from PHP (prevents gulp not found errors)
- Add fullname parameter to Registration template
- Point to correct math validator in Registration template
- Add empty error message div to forms (for SUI front-end validation)
- Allow recipient email TV to be empty in forms (i.e. when using a custom hook)
- Fix inheritance of form label layout settings
- Add label to honeypot fields
- Only load Youtube videos after play button is clicked


## Romanesco Patterns 0.14.1
Released on February 10, 2019

New features:
- Add TV input option for selecting Fibonacci numbers
- Add math question anti-spam option to forms
- Load Semantic UI styles inside CB preview containers

Fixes and improvements:
- Rearrange snippet folders and import a few new ones from projects
- Fix Overview headings displayed as regular links being too large
- Fix Registration template not validating password correctly
- Exclude resources with unchecked "Use alias in URI" from breadcrumbs
- Make icons work inside CB chunk previews
- Make check for detecting SeoTab plugin watertight


## Romanesco Patterns 0.14.0
Released on January 18, 2019

New features:
- Add main navigation with dropdown submenus
- Add template with Table of Contents menu (instead of submenu)
- Add template for Downloads
- Add Kanban layout for Content Purpose elements

Fixes and improvements:
- Update status grid to incorporate new / altered TV values
- Add optional anti-spam hook to forms
- Add option to select background for rich text segments too


## Romanesco Patterns 0.13.0
Released on November 15, 2018

New features:
- Add content purpose TVs
- Add TVs for external links, file attachments and related content
- Add ability to create input options
- Add ability to create crosslinks between resources
- Add re-purpose component, for creating content "flows" inside a central topic
- Add after save hooks for MIGXdb configs
- Add JSON import for input options

Fixes and improvements:
- Add chunk for dynamically generating TV input options from database rows
- Load project timeline through Backyard package and store data in db
- Rearrange TV categories and add rank
- Replace Grunt task for generating GPM config with PHP script
- Make tvToJSON output suitable for use in GPM configs
- Disable CSS background images for Tiled overviews
- Fix sidebar not showing on largest screen on Team and Client pages
- Fix link in Instagram social button


## Romanesco Patterns 0.12.3
Released on October 4, 2018

New features:
- Add OpenGraph metadata to head
- Add snippet for clipping characters from start or end of string
- Add plugin for injecting inverted classes into content (requires HtmlPageDom)
- Add options for controlling footer and bottom CTA content

Fixes and improvements:
- Include homepage in basic template list, so they also have Overview TVs
- Fix author image in compact article overview template
- Disable Disqus comment count in overviews (was acting buggy)
- Prevent decimals in calculated image dimensions from breaking variables file
- Allow overrides for head and footer chunks in all templates
- Fix issues when using multiple file upload fields in form
- Sort available forms by menuindex in Forms CB


## Romanesco Patterns 0.12.2
Released on September 18, 2018

Fixes and improvements:
- Add option to wrap CTAs in segment
- Add size and layout_type settings to Quote CB
- Add titles to button links
- Always set first value in form dropdown as empty default option
- Change CB message size setting to generic field size and use for Quote
- Add inverted layout type to Accordions
- Fix empty subtitles returning as NULL in Tab headers
- Fix fallback image in publication overviews
- Better explanation for Label position setting in forms
- Remove hideEmptyTVCategories plugin (hidden by default in MODX 2.6)


## Romanesco Patterns 0.12.1
Released on July 27, 2018

New features:
- Add registration form template to FormBlocks
- Allow resource / member groups with exclusive access rights to be added
- Exclude members only submenu items in vertical nav and KB overviews

Fixes and improvements:
- Shorten element descriptions to 191 characters (this changed in MODX 2.6)
- Disable raw code tag in pattern examples (this broke in MODX 2.6)
- Add Github to social buttons (and some other small tweaks)
- Add setting to make project hub private (requires Login)
- Load Google Analytics if configuration / context setting is set
- Fix object not found handling in latest plugins
- Fix snippet not found errors for empty fastField tags in MODX 2.6
- Regulate MIME type of Markdown resources with plugin


## Romanesco Patterns 0.12.0
Released on June 6, 2018

New features:
- Add elements for creating a Knowledge Base
- Add option to disable page header
- Add option to disable or override toolbar


## Romanesco Patterns 0.11.3
Released on January 16, 2018

New features:
- Add UpdateStyling plugin to change styling theme from config settings
- Add getImageDimensions snippet to retrieve width and height from image files
- Add splitString snippet to divide output or placeholder into multiple sections

Fixes and improvements:
- Enable editor to add custom (pre)hooks to FormBlocks forms
- Add option to set form layout in Form CB itself
- Mute strange and elusive ImagePlus output line


## Romanesco Patterns 0.11.2
Released on December 20, 2017

New features:
- Add Cards CBs for presenting content inside a set of cards
- Add functionality to automatically reduce Tabs to Accordions on mobile

Fixes and improvements:
- Enable theme overrides for setBoxType snippet
- Add option to manually assign an ID to a Maps CB
- Add IDs to first level CB layouts for better targeting
- Allow smaller profile pictures of persons and organizations
- Add option to select tags to form selection fields
- Add more display variations to Tabs organism
- Add option to select Tab menu position (top, right, bottom or left)
- Add option to select Tab menu heading level (h2,h3,h4,h5,h6,span)


## Romanesco Patterns 0.11.1
Released on July 25, 2017

New features:
- Add CB field for displaying map with marker
- Add snippets for creating repeating input fields to FormBlocks

Fixes and improvements:
- Add ability to use an SVG as global background
- Replace popup class with tooltip to avoid collisions [#82]
- Add ability to use alternate option value in form HTML
- Add ability to choose help text position in form (above or below input)
- Add ability to force fieldset to always display as segment in forms
- Add numeric operator to modifiedIf
- Add outputAsTpl option to modifiedIf (for using then/else value as chunk)
- Fix null result not actually returning false in getContextSetting [#83]
- Fix TV output options being reset to default on GPM build [#80]
- Prevent form submission failing when cb_input_file_id is empty
- Configure grid settings for all Overviews with setBoxType snippet [#79]
- Add id to HTML tag with context_key
- Add inner container to all segments inside ArticleTraditional template


## Romanesco Patterns 0.11.0
Released on April 30, 2017

New features:
- Add CB layout + field for wrapping content in Semantic UI segments
- Add multiple file upload field to FormBlocks

Fixes and improvements:
- Responsive images through srcset and sizes attributes
- Cache each Overview type in its own custom cache partition
- Add icon size and de-emphasize options to Icon SVG
- Refactor gallery / slider combo and add captions
- Prevent collisions between Tab and regular segment types
- Add ability to override Google Analytics tracking code per context
- Add submenus to HeaderVertical navigation
- Add CTAs in HeaderVertical templates through hero unit in header
- Add more aliases for custom templates (for assigning TVs with GPM)
- Add fallbacks to placeholders inside some patterns
- Correct field types and descriptions of some information electrons
- Start adding descriptions to all elements
- Add ability to set dynamic redirect ID in form
- Add row template for auto-generated select options to FormBlocks
- Combine Select Dropdown and Select Options form fields
- Fix Other and Collapsible fields in forms
- Use fieldset / legend markup again in form HTML


## Romanesco Patterns 0.10.6
Released on February 22, 2017

New features:
- Add template and patterns for displaying header vertically

Fixes and improvements:
- Improve footer layout on mobile
- Improve structure of Backyard information segments
- Allow image type to be controlled by a setting in Overviews


## Romanesco Patterns 0.10.5
Released on January 26, 2017

New features:
- Add system setting for specifying Project Dashboard resource ID
- Add system setting for specifying Pattern Library container ID
- Add firstChildID snippet for fetching... the first child ID

Fixes and improvements:
- Refactor Button CB to incorporate icon buttons [BC-BREAK]
- Fix first key not being rendered by jsonToHTML snippet
- Include extension when searching for matching pattern URIs
- Rename / re-purpose ProjectHub template to ProjectDashboard
- Minor tweaks and fixes to Hub elements


## Romanesco Patterns 0.10.4
Released on January 12, 2017

Fixes and improvements:
- Add scripts for included/referring Bosons (ContentBlocks)
- Optimize existing included/referring snippets for more accurate results
- Use prefixes in all included/referring snippets to avoid collisions


## Romanesco Patterns 0.10.3
Internal build only

New features:
- Add option to show an icon inside buttons and tags
- Ability to add anchors inside basic headers
- Add basic styling variant to Tabs CBs

Fixes and improvements:
- Add specific CB layout for patterns in front-end library


## Romanesco Patterns 0.10.2
Released on November 23, 2016

New features:
- Add tools for listing included and referring patterns in front-end library

Fixes and improvements:
- Combine Accordion and Tabs CBs
- Rearrange some electrons in new Connections category
- Hide empty TV categories after moving TVs with FC
- Fix broken path in fbLoadAssets snippet
- Fix broken prism.js code highlighting


## Romanesco Patterns 0.10.1
Released on November 6, 2016

Fixes and improvements:
- Remove remaining TV prefixes from overview tpls
- Change prefixes in main Atomic category names
- Move Status TV's to separate tab


## Romanesco Patterns 0.10.0
Released on October 19, 2016

New features:
- Add option to divide CB layout columns
- Add template to view Testimonials as logo
- Add justified alignment setting to CB field options
- Add alignment setting to heading chunk

Fixes and improvements:
- Split PatternLab package into Romanesco Patterns and Backyard [BC-BREAK]
- Change prefix of FormBlocks system settings [BC-BREAK]
- Change / fix all paths related to old PatternLab package [BC-BREAK]
- Name changes to improve overall logic [BC-BREAK]
- Fix nested layout grids in detail templates receiving incorrect margins
- Fix TV names in Person and Article overviews
- Fix caching of nested chunks in Testimonial overviews
- Fix common pages menu in footer
- Remove auto-calculated height from gallery image thumbnails
- Remove / refactor parts that where too project-specific
- Add ID to hero container, to allow for more accurate targeting in CSS
- Add some missing class names
- Various other minor fixes


## Romanesco Patterns 0.9.1
Released on June 28, 2016

New features:
- Add Slider / Gallery combo CB

Fixes and improvements:
- Organize front-end dependencies in assets/vendor folder


## Romanesco Patterns 0.9.0
Released on June 22, 2016

New features:
- Add front-end pattern library
- Add templates for Team and Testimonial
- Add templates for Clients and Portfolio

Fixes and improvements:
- Refactor overview elements for better reusability [BC-BREAK]
- Load FormBlocks fieldset layout with chunk
- Display syntax highlighted code snippets with Prism.js
- Fix layout backgrounds not working on subdomains
- Fix adding tables and links with Redactor


## Romanesco Patterns 0.8.1
Released on May 5, 2016

New features:
- Add status grid for keeping track of progress per page

Fixes and improvements:
- Use snippets in JSON config files for assigning templates


## Romanesco Patterns 0.8.0
Released on May 5, 2016

New features:
- Add content blocks for arranging content in tabs
- Add Twitter content block

Fixes and improvements:
- Add changelog
- Add symlink for backgrounds.css to web context
- Flexible sidebar width on CB layouts containing a sidebar
- Assign categories to CB elements
- Fix header image and title inheritance
- Fix broken image sliders
- Update jQuery to 2.1.4 and add local fallback for CDN