module PdfjsRails
  module ViewHelpers

    def pdf_viewer(filename)

    	html = <<-HTML
    		<!DOCTYPE html>
			<!--
			Copyright 2012 Mozilla Foundation

			Licensed under the Apache License, Version 2.0 (the "License");
			you may not use this file except in compliance with the License.
			You may obtain a copy of the License at

			    http://www.apache.org/licenses/LICENSE-2.0

			Unless required by applicable law or agreed to in writing, software
			distributed under the License is distributed on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
			See the License for the specific language governing permissions and
			limitations under the License.
			-->
			<html dir="ltr" mozdisallowselectionprint moznomarginboxes>
			  <head>
			    <meta charset="utf-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
			    <meta name="google" content="notranslate">
			    <title>PDF.js viewer</title>


			    <link rel="stylesheet" href="assets/viewer.css"/>

			    <script type="text/javascript" src="assets/compatibility.js"></script>



			<!-- This snippet is used in production, see Makefile -->
			<!-- <link rel="resource" type="application/l10n" href="assets/locale/locale.properties"/> -->
			<script type="text/javascript" src="assets/l10n.js"></script>
			<script type="text/javascript" src="assets/pdf.js"></script>



			    <script type="text/javascript" src="assets/debugger.js"></script>
			    <script type="text/javascript" src="assets/viewer.js"></script>

			  </head>

			  <body tabindex="1">
			    <div id="outerContainer" class="loadingInProgress">

			      <div id="sidebarContainer">
			        <div id="toolbarSidebar">
			          <div class="splitToolbarButton toggled">
			            <button id="viewThumbnail" class="toolbarButton group toggled" title="Show Thumbnails" tabindex="2" data-l10n-id="thumbs">
			               <span data-l10n-id="thumbs_label">Thumbnails</span>
			            </button>
			            <button id="viewOutline" class="toolbarButton group" title="Show Document Outline" tabindex="3" data-l10n-id="outline">
			               <span data-l10n-id="outline_label">Document Outline</span>
			            </button>
			          </div>
			        </div>
			        <div id="sidebarContent">
			          <div id="thumbnailView">
			          </div>
			          <div id="outlineView" class="hidden">
			          </div>
			        </div>
			      </div>  <!-- sidebarContainer -->

			      <div id="mainContainer">
			        <div class="findbar hidden doorHanger hiddenSmallView" id="findbar">
			          <label for="findInput" class="toolbarLabel" data-l10n-id="find_label">Find:</label>
			          <input id="findInput" class="toolbarField" tabindex="21">
			          <div class="splitToolbarButton">
			            <button class="toolbarButton findPrevious" title="" id="findPrevious" tabindex="22" data-l10n-id="find_previous">
			              <span data-l10n-id="find_previous_label">Previous</span>
			            </button>
			            <div class="splitToolbarButtonSeparator"></div>
			            <button class="toolbarButton findNext" title="" id="findNext" tabindex="23" data-l10n-id="find_next">
			              <span data-l10n-id="find_next_label">Next</span>
			            </button>
			          </div>
			          <input type="checkbox" id="findHighlightAll" class="toolbarField">
			          <label for="findHighlightAll" class="toolbarLabel" tabindex="24" data-l10n-id="find_highlight">Highlight all</label>
			          <input type="checkbox" id="findMatchCase" class="toolbarField">
			          <label for="findMatchCase" class="toolbarLabel" tabindex="25" data-l10n-id="find_match_case_label">Match case</label>
			          <span id="findMsg" class="toolbarLabel"></span>
			        </div>
			        <div class="toolbar">
			          <div id="toolbarContainer">
			            <div id="toolbarViewer">
			              <div id="toolbarViewerLeft">
			                <button id="sidebarToggle" class="toolbarButton" title="Toggle Sidebar" tabindex="4" data-l10n-id="toggle_sidebar">
			                  <span data-l10n-id="toggle_sidebar_label">Toggle Sidebar</span>
			                </button>
			                <div class="toolbarButtonSpacer"></div>
			                <button id="viewFind" class="toolbarButton group hiddenSmallView" title="Find in Document" tabindex="5" data-l10n-id="findbar">
			                   <span data-l10n-id="findbar_label">Find</span>
			                </button>
			                <div class="splitToolbarButton">
			                  <button class="toolbarButton pageUp" title="Previous Page" id="previous" tabindex="6" data-l10n-id="previous">
			                    <span data-l10n-id="previous_label">Previous</span>
			                  </button>
			                  <div class="splitToolbarButtonSeparator"></div>
			                  <button class="toolbarButton pageDown" title="Next Page" id="next" tabindex="7" data-l10n-id="next">
			                    <span data-l10n-id="next_label">Next</span>
			                  </button>
			                </div>
			                <label id="pageNumberLabel" class="toolbarLabel" for="pageNumber" data-l10n-id="page_label">Page: </label>
			                <input type="number" id="pageNumber" class="toolbarField pageNumber" value="1" size="4" min="1" tabindex="8">
			                </input>
			                <span id="numPages" class="toolbarLabel"></span>
			              </div>
			              <div id="toolbarViewerRight">
			                <button id="presentationMode" class="toolbarButton presentationMode hiddenSmallView" title="Switch to Presentation Mode" tabindex="12" data-l10n-id="presentation_mode">
			                  <span data-l10n-id="presentation_mode_label">Presentation Mode</span>
			                </button>

			                <button id="openFile" class="toolbarButton openFile hiddenSmallView" title="Open File" tabindex="13" data-l10n-id="open_file">
			                   <span data-l10n-id="open_file_label">Open</span>
			                </button>

			                <button id="print" class="toolbarButton print" title="Print" tabindex="14" data-l10n-id="print">
			                  <span data-l10n-id="print_label">Print</span>
			                </button>

			                <button id="download" class="toolbarButton download" title="Download" tabindex="15" data-l10n-id="download">
			                  <span data-l10n-id="download_label">Download</span>
			                </button>
			                <!-- <div class="toolbarButtonSpacer"></div> -->
			                <a href="#" id="viewBookmark" class="toolbarButton bookmark hiddenSmallView" title="Current view (copy or open in new window)" tabindex="16" data-l10n-id="bookmark"><span data-l10n-id="bookmark_label">Current View</span></a>
			              </div>
			              <div class="outerCenter">
			                <div class="innerCenter" id="toolbarViewerMiddle">
			                  <div class="splitToolbarButton">
			                    <button id="zoomOut" class="toolbarButton zoomOut" title="Zoom Out" tabindex="9" data-l10n-id="zoom_out">
			                      <span data-l10n-id="zoom_out_label">Zoom Out</span>
			                    </button>
			                    <div class="splitToolbarButtonSeparator"></div>
			                    <button id="zoomIn" class="toolbarButton zoomIn" title="Zoom In" tabindex="10" data-l10n-id="zoom_in">
			                      <span data-l10n-id="zoom_in_label">Zoom In</span>
			                     </button>
			                  </div>
			                  <span id="scaleSelectContainer" class="dropdownToolbarButton">
			                     <select id="scaleSelect" title="Zoom" tabindex="11" data-l10n-id="zoom">
			                      <option id="pageAutoOption" value="auto" selected="selected" data-l10n-id="page_scale_auto">Automatic Zoom</option>
			                      <option id="pageActualOption" value="page-actual" data-l10n-id="page_scale_actual">Actual Size</option>
			                      <option id="pageFitOption" value="page-fit" data-l10n-id="page_scale_fit">Fit Page</option>
			                      <option id="pageWidthOption" value="page-width" data-l10n-id="page_scale_width">Full Width</option>
			                      <option id="customScaleOption" value="custom"></option>
			                      <option value="0.5">50%</option>
			                      <option value="0.75">75%</option>
			                      <option value="1">100%</option>
			                      <option value="1.25">125%</option>
			                      <option value="1.5">150%</option>
			                      <option value="2">200%</option>
			                    </select>
			                  </span>
			                </div>
			              </div>
			            </div>
			            <div id="loadingBar">
			              <div class="progress">
			                <div class="glimmer">
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>

			        <menu type="context" id="viewerContextMenu">
			          <menuitem id="firstPage" label="First Page"
			                    data-l10n-id="first_page" ></menuitem>
			          <menuitem id="lastPage" label="Last Page"
			                    data-l10n-id="last_page" ></menuitem>
			          <menuitem id="pageRotateCcw" label="Rotate Counter-Clockwise"
			                    data-l10n-id="page_rotate_ccw" ></menuitem>
			          <menuitem id="pageRotateCw" label="Rotate Clockwise"
			                    data-l10n-id="page_rotate_cw" ></menuitem>
			        </menu>

			        <div id="viewerContainer" tabindex="0">
			          <div id="viewer" contextmenu="viewerContextMenu"></div>
			        </div>

			        <div id="errorWrapper" hidden='true'>
			          <div id="errorMessageLeft">
			            <span id="errorMessage"></span>
			            <button id="errorShowMore" data-l10n-id="error_more_info">
			              More Information
			            </button>
			            <button id="errorShowLess" data-l10n-id="error_less_info" hidden='true'>
			              Less Information
			            </button>
			          </div>
			          <div id="errorMessageRight">
			            <button id="errorClose" data-l10n-id="error_close">
			              Close
			            </button>
			          </div>
			          <div class="clearBoth"></div>
			          <textarea id="errorMoreInfo" hidden='true' readonly="readonly"></textarea>
			        </div>
			      </div> <!-- mainContainer -->

			    </div> <!-- outerContainer -->
			    <div id="printContainer"></div>

			    <script type="text/javascript">
					document.addEventListener('DOMContentLoaded', function() {
					PDFView.open(#{filename.to_json});
					}, true);
				</script>
		
			  </body>
			</html>
    	HTML

    	html.html_safe
    end

    
  end
end