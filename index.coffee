#-----------------------------------------------------------------------#
# fritzBoxPro for Übersicht
# Created April 2020 by Johannes Hubig

# Position of the widget on your screen
pos_top		= '120px'
pos_left	= '370px'

#-----------------------------------------------------------------------#

command: "fritzBoxPro.widget/fritzBoxShell.sh"

# Update every 60 seconds (don't put higher refresh rate than 20 seconds - There seems to be a limit by the TR064 protocol requests)
refreshFrequency: 30000

style: """
  top:	#{pos_top}
  left:	#{pos_left}
  font-family: Avenir Next

  .container
     width: 90%
     margin: auto

  .mobile-wrapper
     background: rgba(255, 255, 255, 0.7)
     position: relative
     width: 360px
     min-height: 100%
     margin: auto
     padding: 10px 0 20px
     border-radius: 10px
     box-shadow: 0px 10px 30px -10px #000
     overflow: hidden

  .header-box
     background: linear-gradient(to left, #485fed, rgba(255, 255, 255, .2)), #485fed
     color: #FFF
     padding: 4px 15px
     position: relative
     box-shadow: 0px 0px 20px -7px #485fed

     .header-subtitle
        font-weight: 400
        position: relative
        font-size: 12px
        text-shadow: 0px 0px 5px  rgba(#000, 0.5)

     .header-title
        font-size: 20px
        margin: 3px 0 0 0
        letter-spacing: 1px
        font-weight: 600
        text-shadow: 0px 0px 5px  rgba(#000, 0.5)

     .header-icon
        position: absolute
        top: 48%
        transform: translateY(-50%)
        right: 20px

  .data-section
     margin-top: -8px
     .container
        h3
           color: #333
           font-size: 15px
           padding-top: 7px
           margin-bottom: 8px
           margin-left: -8px
           position: relative
           &::before // for horizontal line at section title
              content: ""
              display: block
              width: 78%
              height: 2px
              background-color: #999
              position: absolute
              top: 60%
              right: 0

        .data-wrapper
           margin-bottom: -10px
           .data-item
              position: relative
              margin-bottom: 5px
              padding-left: 30px
              cursor: pointer

              .data__point
                 margin: 0
                 color: #333
                 font-size: 14px
                 font-weight: 500
                 letter-spacing: 0.5px

              .data__title
                position: absolute
                top: 0px
                right: 0
                color: #666
                font-size: 11px
                font-weight: 600
                font-style: italic

              .data_point_sublabel
                position: relative
                top: -1px
                left: 5px
                color: #666
                font-size: 10px
                font-weight: 500
                font-style: italic

// CSS for ICONS

  .icon
    width: auto
    position: absolute
    left: 0px
    top: -1px

  .icon_pulsing
    width: auto
    position: absolute
    left: 0px
    top: -1px

  .icon_pulsing:before
    position: absolute
    top: 3px
    left: 3px
    width: 14px
    height: 14px
    border-radius: 50%
    content: ''
    box-shadow: inset 0 0 0 6px #f00
    transition: transform 0.2s, opacity 0.2s
    animation: pulsing 2.1s infinite
    z-index: -1

  @keyframes pulsing
    0%
      transform: scale(1)
      opacity: 1

    50%
      transform: scale(2)
      opacity: 1

    100%
      transform: scale(1)
      opacity: 0

"""

render: -> """
  <div class="mobile-wrapper">

   <section class="header-box" id="header-box">
      <h3 class="header-title">My Fritz!Box</h3>
      <span class="header-subtitle" id="model">N/A</span>
      <div class="header-icon">
         <img style='vertical-align:middle; margin-top: 0px' src='fritzBoxPro.widget/FritzLogo70px.png'/>
      </div>
   </section>

   <!--======= Data section General =======-->

   <section class="data-section">
      <div class="container">
         <h3>
            General
         </h3>
         <div class="data-wrapper">
            <div class="data-item">
               <div class="icon" id="firmware_div"><img id="firmware_icon" src='fritzBoxPro.widget/icons/accept_database.svg' height="20px;"/></div>
               <h4 class="data__point" id='firmwareVersion'>N/A</h4>
               <div class="data_point_sublabel" id="firmwareUpdateAvailable" style="display:none">N/A</div>
               <span class="data__title">Firmware</span>
            </div>
            <div class="data-item">
               <div class="icon"><img id="provider_icon" src='fritzBoxPro.widget/icons/filing_cabinet.svg' height="20px;"/></div>
               <h4 class="data__point" id='providerName'>N/A</h4>
               <span class="data__title">Provider</span>
            </div>
            <div class="data-item">
               <div class="icon"><img id="uptime_icon" src='fritzBoxPro.widget/icons/clock.svg' height="20px;"/></div>
               <h4 class="data__point" id='uptime'>N/A</h4>
               <span class="data__title">Uptime</span>
            </div>
            <!--
            <div class="data-item">
               <h4 class="data__point" id='errorLog'>N/A</h4>
               <span class="data__title">errorLog</span>
            </div>
            -->
      </div>
   </section>



   <!--======= Data section Network =======-->

   <section class="data-section">
      <div class="container">
         <h3>
            Network
         </h3>
         <div class="data-wrapper">
            <div class="data-item">
               <div class="icon"><img id="externalIP" src='fritzBoxPro.widget/icons/link.svg' height="20px;"/></div>
               <h4 class="data__point" id='ipAddress'>N/A</h4>
               <span class="data__title">Ext. IP Address</span>
            </div>
            <div class="data-item">
               <!--<div class="onoffswitch">
                   <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="wifi2gswitch" checked>
                   <label class="onoffswitch-label" for="wifi2gswitch">
                       <span class="onoffswitch-inner"></span>
                       <span class="onoffswitch-switch"></span>
                   </label>
               </div>-->
               <div class="icon"><img id="wifi2gswitch" src='fritzBoxPro.widget/icons/cancel.svg' height="20px;"/></div>
               <h4 class="data__point">SSID: <span id='2g_SSID'> N/A</span></h4>
               <div class="data_point_sublabel" id="2g_connectedDevices">N/A</div>
               <span class="data__title">2.4 Ghz WiFi</span>
            </div>
            <div class="data-item">
               <div class="icon"><img id="wifi5gswitch" src='fritzBoxPro.widget/icons/cancel.svg' height="20px;"/></div>
               <h4 class="data__point">SSID: <span id='5g_SSID'> N/A</span></h4>
               <div class="data_point_sublabel" id="5g_connectedDevices">N/A</div>
               <span class="data__title">5 Ghz WiFI</span>
            </div>
            <div class="data-item">
               <div class="icon"><img id="wifiguestswitch" src='fritzBoxPro.widget/icons/cancel.svg' height="20px;"/></div>
               <h4 class="data__point">SSID: <span id='guest_SSID'> N/A</span></h4>
               <div class="data_point_sublabel" id="guest_connectedDevices">N/A</div>
               <span class="data__title">Guest WiFI</span>
            </div>
      </div>
   </section>

   <!--======= Data section TAM (Answering machine) =======-->

   <section class="data-section">
      <div class="container">
         <h3>
            TAM
         </h3>
         <div class="data-wrapper">
            <div class="data-item">
               <div class="icon"><img id="tamswitch" src='fritzBoxPro.widget/icons/cancel.svg' height="20px;"/></div>
               <h4 class="data__point"><span id='nameTAM'> N/A</span></h4>
               <span class="data__title">Name</span>
            </div>
            <div class="data-item">
              <div class="icon" id="voicemail_div"><img id="voicemail" src='fritzBoxPro.widget/icons/voicemail.svg' height="20px;"/></div>
              <h4 class="data__point"><span id='nbOfCallsNew'> N/A</span> / <span id='nbOfCallsTotal'> N/A</span></h4>
              <span class="data__title">New / Total calls</span>
            </div>
      </div>
   </section>
</div>

"""

update: (output,domEl) ->
  values	= output.split("\n")
  div			= $(domEl)

# ----------- For 2.4 Ghz WiFi display ------------
  values2G = values[0].split(";")

  if (values2G[1] != "")
    div.find('#2g_SSID').html(values2G[1])

  if (values2G[3] != "")
    div.find('#2g_connectedDevices').html(values2G[3] + " devices connected")

  if (parseInt(values2G[2]) == 1)
    #div.find('#wifi2gswitch').attr("checked", true)
    div.find('#wifi2gswitch').attr("src", "fritzBoxPro.widget/icons/ok.svg")
  else if (parseInt(values2G[2]) == 0)
    div.find('#wifi2gswitch').attr("src", "fritzBoxPro.widget/icons/cancel.svg")

# ------------ For 5 Ghz WiFi display -------------
  values5G = values[1].split(";")

  if (values5G[1] != "")
    div.find('#5g_SSID').html(values5G[1])

  if (values5G[3] != "")
    div.find('#5g_connectedDevices').html(values5G[3] + " devices connected")

  if (parseInt(values5G[2]) == 1)
    div.find('#wifi5gswitch').attr("src", "fritzBoxPro.widget/icons/ok.svg")
  else if (parseInt(values5G[2]) == 0)
    div.find('#wifi5gswitch').attr("src", "fritzBoxPro.widget/icons/cancel.svg")

# ------------ For Guest WiFi display -------------
  valuesGuest = values[2].split(";")

  if (valuesGuest[1] != "")
    div.find('#guest_SSID').html(valuesGuest[1])

  if (valuesGuest[3] != "")
    div.find('#guest_connectedDevices').html(valuesGuest[3] + " devices connected")

  if (parseInt(valuesGuest[2]) == 1)
    div.find('#wifiguestswitch').attr("src", "fritzBoxPro.widget/icons/ok.svg")
  else if (parseInt(valuesGuest[2]) == 0)
    div.find('#wifiguestswitch').attr("src", "fritzBoxPro.widget/icons/cancel.svg")

# ---------- External IP Address display ----------
  if (values[3] != "")
    div.find('#ipAddress').html(values[3])

# ------------ Fritz!Box model display ------------
  if (values[4] != "")
    div.find('#model').html(values[4])

# ---------- Firmware version display ---------q----
  if (values[5] != "")
    div.find('#firmwareVersion').html("v" + values[5].split(".")[1] + "." + values[5].split(".")[2])

  if (parseInt(values[12]) == 1)
    div.find('#firmware_icon').attr("src", "fritzBoxPro.widget/icons/data_backup.svg")
    div.find('#firmwareUpdateAvailable').html("Firmware update available. Visit http://fritz.box")
    div.find('#firmwareUpdateAvailable').attr("style", "display:block")
    div.find('#firmware_div').attr("class", "icon_pulsing")
  else if (parseInt(values[12]) == 0)
    div.find('#firmware_icon').attr("src", "fritzBoxPro.widget/icons/accept_database.svg")
    div.find('#firmwareUpdateAvailable').attr("style", "display:none")
    div.find('#firmware_div').attr("class", "icon")

# --------------- Uptime display ------------------
  if (values[6] != "")
    div.find('#uptime').html(values[6].split(":")[0] + " d, " + values[6].split(":")[1] + " h, " + values[6].split(":")[2] + " m")

# ------- Answering machine (TAM) display ---------

  if (values[7] != "")
    div.find('#nameTAM').html(values[7].split(" ")[1])

  if (parseInt(values[8].split(" ")[1]) == 1)
    div.find('#tamswitch').attr("src", "fritzBoxPro.widget/icons/ok.svg")
  else if (parseInt(values[8].split(" ")[1]) == 0)
    div.find('#tamswitch').attr("src", "fritzBoxPro.widget/icons/cancel.svg")

  if (values[9] != "")
    div.find('#nbOfCallsNew').html(values[9])

    if(parseInt(values[9]) >= 1)
      div.find('#voicemail_div').attr("class", "icon_pulsing")
      div.find('#nbOfCallsNew').attr("style", "color:red")
    else if(parseInt(values[9]) == 0)
      div.find('#voicemail_div').attr("class", "icon")
      div.find('#nbOfCallsNew').attr("style", "color:#333")

  if (values[10] != "")
    div.find('#nbOfCallsTotal').html(values[10].split(":")[1])

  # --------------- Provider name display ------------------

  if (values[11] != "")
    div.find('#providerName').html(values[11])
