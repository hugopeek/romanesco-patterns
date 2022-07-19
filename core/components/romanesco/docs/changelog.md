# Changelog for the Romanesco pattern library

## Romanesco Patterns 1.0.0-beta10
Released on ...

Fixes and improvements:
- Change button to bottom attached in Card CB
- Fix slider after updating Swiper to v8
- Check for autoloaded HtmlPageDom class in plugins
- Fix broken references in status grid and project timeline
- Load overview images with chunk (resolves repeating image issue in fluid tpl)
- Add overviewRowImageBasicOverlay chunk to config
- Use navbar_size setting to define dropdown ToC size
- Add cases for loading Toast and Flag assets
- Use custom dist path to fetch Form and Calendar CSS
- Hide local submenu level up link if parent is hidden in menu
- Apply alignment to content element in card overviews

## Romanesco Patterns 1.0.0-beta9
Released on May 24, 2022

New features:
- Add option to show sidebar on mobile
- Add option to show CTA in sidebar
- Add local submenu variant (only shows children of current page)
- Add reusable buttons for social connections and sharing

Fixes and improvements:
- Deprecate social media TVs
- Add FormBlocks dropdown row for resources
- Rename element categories for consistency and prefix TV categories
- Minify custom CSS regardless of configuration setting
- Invert secondary menu inside segments with inverted background
- Load frontend lexicon OnHandleRequest
- Load FormBlocks forms only in specific context if placed in subfolder
- Collapse or expand target container when reloading Show/Hide option
- Don't disable completed steps when backtracking in multi-step forms
- Fix frontend validation not working in multi-step forms
- Add option to hide advanced CB features in manager
- Add missing setBackground modifier to rich text segment and several layouts
- Update patterns and structure in specific overviewRowFluid templates
- Prevent Overview classes placeholders from leaking their values
- Replace remaining If isnull comparisons with iselement
- Add TV to select which heading levels are included in the ToC menu
- Add layout options for dropdown and list views in ToC CB
- Fix empty srcset values when using the same image more than once on a page
- Load buttons, content images and card rows with chunk (instead of outputAsTpl)
- Don't load image tag if Gallery or Cards image is empty
- Add ability to define custom render hooks in FormBlocks forms 
- Add ability to choose different value type when using Input Options in forms
- Add option to FormBlocks fields to override the name attribute in HTML
- Add caching and optimize requests for Youtube and Vimeo thumbnails
- Remove nested troublemakers from headings in ToC menu
- Add error messages to date range fields 
- Add improved readability layout width (with normal text size)
- Add controls for inflated titles in main layout columns and CTAs
- Load jQuery from local source when offline
- Trim whitespace from edges if using clipString without value
- Fix Romanesco class not being loaded when creating automatic references
- Fix uid for imgResponsive chunks inside Image CBs

## Romanesco Patterns 1.0.0-beta8
Released on November 19, 2021

New features:
- Add option to automatically link to external references in content
- Add ability to crop regular content images
- Add widget to collect feedback from client browser (currently using Ybug)
- Add isEditor snippet to check if user is logged in to manager

Fixes and improvements:
- Add box shadow to Markdown images
- Turn external links TV into MIGXdb grid [BC]
- Don't generate critical CSS for Downloads
- Fix issue where slider would break if slides are separate Image CBs
- Prevent content in Presentation template from being turned into a slider
- Add relevant settings from regular overview CBs to 2 column fluid overview
- Rename incorrect cols field to content_width in 2 column fluid overview [BC]
- Add quality override setting for global background image
- Optimize distribution of breakpoint values for responsive image srcsets
- Apply responsive image sizing to Cards CB
- Don't load SVG images with srcset and sizes in galleries
- Improve accuracy of responsive image sizes for stackable and doubling grids
- Improve structure of content and gallery image patterns
- Always round max height pixel values up to next whole number
- Make sure decimal separator is a '.' when rounding numbers
- Calculate correct thumb height in Open Graph image metadata
- Limit Open Graph metadata to 1 image
- Remove submit class from submit button container in forms
- Make front-end form validation compatible with Recaptcha v3
- Load headAdditional and footerAdditional chunks directly, if present
- Place rel element at front of external CSS links
- Defer loading of Leaflet JS
- Add missing rel stylesheet element to Leaflet CSS link
- Explicitly enable front-end validation in FormBlocks forms
- Abort optimization if image type is SVG
- Fix image optimization in srcset rows

## Romanesco Patterns 1.0.0-beta7
Released on October 21, 2021

New features:
- Add front-end validation to FormBlocks
- Add option to use Recaptcha v3 in forms
- Add ContentBlock with Table of Contents menu
- Add output modifier for pThumb to optimize image and generate WebP version

Fixes and improvements:
- Make sure inverted path configuration settings don't trigger CSS rebuild
- Fix scenario where getImageDimensions would not return width and height
- Make sure AjaxUpload scripts are run after jQuery is loaded
- Add missing upload_limit and max_file_size CB settings in AjaxUpload snippet
- Rename formblocks.antispam setting to formblocks.antispam_hooks
- Wait with loading Recaptcha v2 until form becomes active
- Move honeypot and recaptcha elements to separate (overridable) chunk
- Fix responsive content image sizes in stackable on tablet grids
- If grids are stackable on tablet, also show/hide designated mobile elements
- Use placeholder to detect ToC instead of toc_enabled_templates system setting
- Show ToC submenu in dropdown on tablet and mobile
- Move shared overview settings to separate molecules
- Fix regClient scripts not being parsed in Markdown pages on first load
- Load external JS from head with defer
- Load all conditional assets through a single snippet
- Don't use tag label variant anywhere (excluded from default semantic.css)
- Add SUI list class to ul and ol tags in Markdown (only at first level)
- Remove conditionals for empty logo paths (to clear media source path)
- Add theme variables for inverted logo paths
- Only load alternative_tracking_code if Google Analytics is empty
- Rename matomo_tracking_code to alternative_tracking_code
- Move Leaflet asset paths and integrity hashes to system settings
- Move img_breakpoints to system settings
- Add img_quality as system setting too (baseline for optional post-processing)
- Fix icon buttons in generated tab navigation
- Only preload backgrounds.css if critical CSS is enabled
- Add missing ID to FormBlocks dropdown select and math question fields
- Add lazy load setting to Overview Fluid layout

## Romanesco Patterns 1.0.0-beta6
Released on August 30, 2021

New features:
- Use Markdown content with any template

Fixes and improvements:
- Fix lists with connected patterns in front-end library
- Add class to empty grid columns
- Load conditional CSS assets and Google fonts asynchronously
- Load Google fonts with direct link and v2 syntax [BREAKING CHANGE]
- Add cbLayoutCTA chunk (not referenced directly)
- Make sure width or height is not 0 in fixed overview and gallery images
- Fix scenario where mobile-only slider would not return to original state
- Fix issues with slides not receiving correct width when initialized 
- Rename toolbarKnowledgeBase to toolbarNote
- Rename HeaderVertical templates to BasicVertical
- Merge NoteMarkdown and NoteContentBlocks templates
- Add option to show pages with hidden alias in breadcrumbs
- Rename cbOverviewRowImg chunks to imgOverview [BREAKING CHANGE]
- Fix critical CSS not being shared between templates (if configured)
- Set pagetitle as fallback for overview image ALT text

## Romanesco Patterns 1.0.0-beta5
Released on June 10, 2021

Fixes and improvements:
- Set default responsive image scaling value to 51
- Fix email not being sent when using dynamic emailTo (and empty regular field)
- Make sure placeholder prefixes are unique when generating background CSS
- Properly display MODX outer tags from Markdown files (if they've been split)
- Add option to generate critical CSS for pages behind htpasswd wall
- Fix returnFirstHit snippet skipping over hits
- Add gallery lightbox after the footer (and not inside)
- Make Fibonacci sequence generator more flexible
- Let MODX clear overview cache if custom cache is disabled

## Romanesco Patterns 1.0.0-beta4
Released on April 19, 2021

New features:
- Add ability to schedule critical CSS generation
- Look for masthead chunk in header
- Add TV for overriding subtitle in Overviews
- Implement cache buster for static assets
- Add output modifier for replacing regex pattern

Fixes and improvements:
- Preload critical CSS file from HTML (disable HTTP/2 server push)
- Allow theme override for structured organization data
- Don't render theme chunks before checking if they exist
- Add iselement condition to modifiedIf
- Also manipulate DOM of Markdown resources
- Remove nested block level elements from heading tags
- Move most common subtitles out of heading tags
- Rename all headingHierarchy chunks to headingOverview [BREAKING CHANGE]
- Remove YAML front matter from Markdown notes
- Accept semantic version numbers for generated styling assets
- Move off-canvas navigation above content wrapper to prevent redraw in JS
- Add warning not to edit site.css directly
- Don't display globally excluded resources in Overviews either
- Prevent bad link tag errors from CTAs that don't have a link

## Romanesco Patterns 1.0.0-beta3
Released on February 20, 2021

New features:
- Load patterns dynamically in front-end library
- Add elements for displaying Vimeo embeds
- Add preview and status properties to all elements

Fixes and improvements:
- Center copyright footer content on mobile
- Add small credits badge with information popup to copyright footer
- Skip own element properties in returnFirstHit snippet
- Add option to adjust column size to content width in CB settings
- Scroll back to top after using pagination in overviews (can be disabled)
- Only display avatar image in publication elements if author page exists
- Add overview image template for ImagePlus with fixed dimensions
- Don't show hidden forms, CTAs, backgrounds and footers in CB selectors
- Fix behaviour and styling glitches in FormBlocks checkbox / radio fields
- Fix footer and footer CTA backgrounds referenced by ID
- Make sure unique_idx placeholder in overviews is actually unique
- Add system setting for defining templates with ToC
- Load Leaflet map assets via chunk
- Add ability to turn Cards CB into a slider
- Fix quality placeholder not being forwarded to responsive images srcsets
- Modify getElementDescription snippet to get other fields or property values
- Add raw placeholder chunks for tag and label
- Change HTML tag of footer CTA from footer to aside
- Load SUI form component asynchronous if critical CSS is enabled
- Fix issue where processor sometimes used stale alias in critical CSS snippet
- Save resource in critical CSS snippet, to generate TV value with file path
- Generate critical CSS with correct multi-context Configuration settings
- Correct depth and offset placeholders in overviews

## Romanesco Patterns 1.0.0-beta2
Released on November 3, 2020

Fixes and improvements:
- Remove head tag from head chunk [BREAKING CHANGE]
- Use Matomo by inserting full tracking code directly
- Make background in note templates transparent
- Fix leaking placeholders in global backgrounds CSS
- Fall back gracefully when critical CSS file not found
- Store full path to critical CSS file in a hidden TV
- Don't use minified SUI / project assets if Configuration setting is off
- Fix cols placeholder in overviews
- Limit overview grids to 2 rows in manager previews
- Accept additional responsive image scales
- Allow templates to override the critical CSS file of the page
- Add option to generate critical CSS in sequence instead of parallel
- Handle context aware configuration settings in critical CSS plugin
- Disable deprecated global backgrounds using MIGX TV

## Romanesco Patterns 1.0.0-beta1
Released on August 27, 2020

New features:
- Add ability to generate critical CSS for each resource

Fixes and improvements:
- Prevent empty logo path in Configuration from triggering a CSS rebuild
- Fix placeholder for due date in status grid
- Accept overview fallback images for each image type
- Don't transform input to lowercase in removeDuplicateLines snippet
- Don't add header class to content headers if they already have one
- Replace hardcoded Menu text in main nav with lexicon key
- Add classes with placeholder in main accordion navigation
- Fix background in article template introduction segment
- Fix path to default context CSS in GenerateStaticCSS
- Add ability to place slider controls outside of container
- Turn lightbox into fullscreen modal and lazy load images
- Make Gallery images sizes responsive
- Add option to lazy load Gallery images
- Add link rel options to Button and Image CBs
- Fix path to custom context CSS in GenerateStaticCSS

## Romanesco Patterns 0.16.4
Released on July 1, 2020

Fixes and improvements:
- Refactor main accordion menu
- Fix broken favicon file names and colors
- Add setting for custom favicon path
- Add option to activate FormSource in FormBlocks reports
- Add ability to change custom CSS path (per context, if needed)
- Create absolute path for CSS backgrounds that won't be thumbnailed
- Rename Semantic assets paths in system settings
- Correctly escape double quote and backslash characters in JSON-LD output

## Romanesco Patterns 0.16.3
Released on June 15, 2020

Fixes and improvements:
- Add scrolldir.js for displaying menu on mobile when scrolling up
- Add ability to override headerTitles chunk
- Load CB image settings with chunks
- Add caption and credits to Image CB
- Add positioning and sizing options to Image CB
- Point to separate gulpfile when generating CSS per context
- Update Jquery to v3.5.1
- Fix static downloads not having any content
- Write theme.variables output directly to file
- Make UpdateStyling plugin work with context-aware Configuration settings
- Fix form redirectTo placeholder not always returning correct value
- Add returnFirstHit snippet
- Break comma separated lists into rows in form emails
- Fix submission of 'other' values in all forms
- Look for menu title first when adding multi-step form headings
- Fix sort order of field data in multi-step form emails
- Fix reapplying checkbox values and 'other' fields in multi-step forms
- Add row templates for autogenerated form fields based on input options
- Fix faulty multi-step placeholder in form CB
- Add rawAlias placeholder chunk
- Load custom form assets through fbLoadAssets (if present)

## Romanesco Patterns 0.16.2
Released on April 20, 2020

New features:
- Add elements for displaying FAQs with structured markup

Fixes and improvements:
- Add option to embed Youtube video directly
- Add option to manually correct aspect ratio of Youtube embed
- Ensure highest resolution thumbnail is fetched for Youtube embed placeholder
- Switch to JSON-LD for structured breadcrumbs data
- Improve structured data JSON-LD snippet in head
- Reorganize data elements folder structure
- Use uniform placeholders in Accordions, Cards and Tabs
- Add heading level to accordions
- Don't let ToC menu include headings outside of content area

## Romanesco Patterns 0.16.1
Released on April 14, 2020

Fixes and improvements:
- Inherit comment toggle and article author TV values
- Prevent background from appearing if responsive crop is not defined
- Improve layout of publication templates
- Add button templates for creating neighbor menu
- Add class to content headers without class name
- Conditionally load assets for registration forms
- Remove form class from search field
- Implement multi-page form functionality into FormBlocks
- Add options to adjust type, size and alignment of form buttons
- Fix finding value in multidimensional array with jsonGetValue
- Add first and last placeholders to splitString snippet
- Add class to video embed, to initialize them separately from other embeds

## Romanesco Patterns 0.16.0
Released on March 30, 2020

New features:
- Add ability to create multi-page forms (manually)
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
- Refactor Button CB to incorporate icon buttons [BC]
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
- Move Status TVs to separate tab


## Romanesco Patterns 0.10.0
Released on October 19, 2016

New features:
- Add option to divide CB layout columns
- Add template to view Testimonials as logo
- Add justified alignment setting to CB field options
- Add alignment setting to heading chunk

Fixes and improvements:
- Split PatternLab package into Romanesco Patterns and Backyard [BC]
- Change prefix of FormBlocks system settings [BC]
- Change / fix all paths related to old PatternLab package [BC]
- Name changes to improve overall logic [BC]
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
- Refactor overview elements for better reusability [BC]
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