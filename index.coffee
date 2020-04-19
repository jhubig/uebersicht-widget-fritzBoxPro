#-----------------------------------------------------------------------#
# fritzBoxPro for Übersicht
# Created April 2020 by Johannes Hubig

# THEME OPTIONS: dark or light	(default is dark)

theme		= 'light'

# Position of the widget on your screen
pos_top		= '90px'
pos_left	= '310px'

#-----------------------------------------------------------------------#

if theme == 'dark'
  titleColor	= '#999999'
  infoColor		= '#CCCCCC'
  dataColor		= '#FFFFFF'
  lineColor		= '#43ace6'
  barColor    = '#777777'
  bkground		= 'rgba(#000, 0.5)'

else if theme == 'light'
  titleColor	= '#71FF71'
  infoColor		= '#71FF71'
  dataColor		= '#FFFFFF'
  lineColor		= '#FFFFFF'
  barColor    = '#AAAAAA'
  bkground		= 'rgba(#999, 0.5)'

else
  titleColor	= '#999999'
  infoColor		= '#CCCCCC'
  dataColor		= '#FFFFFF'
  lineColor		= '#43ace6'
  barColor    = '#777777'
  bkground		= 'rgba(#000, 0.5)'

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
     background: rgba(255, 255, 255, .5)
     /* relative with .today-box::before*/
     z-index: 1  /*positive*/ // PARENT
     position: relative
     /*---------*/
     width: 350px
     min-height: 100%
     margin: auto
     padding: 10px 0 20px
     border-radius: 10px
     box-shadow: 0px 10px 30px -10px #000
     overflow: hidden

  .header
     padding-bottom: 0px
     margin-bottom: 0px
     .container
        position: relative
        font-size: 13px
        margin-top: 0px
        span
           color: #444
           font-family: 'Ramabhadra'
           font-size: 10px
           font-weight: 1000
        h1
           margin-top: 2px
           color: #919294
           font-size: 50px
           font-weight: 300


        &::before
           content: ""
           display: block
           width: 0
           height: 0
           border: 6px solid transparent
           border-left-color: #e8e8e8
           position: absolute
           bottom: -13px
           right: 0px

        &::after
           content: ""
           display: block
           width: calc(100% - 10px)
           height: 2px
           background-color: #e8e8e8
           position: relative
           top: 8px




  .today-box
     background: linear-gradient(to left, #485fed, rgba(255, 200, 118, .25)), #485fed
     color: #FFF
     padding: 4px 15px
     position: relative
     box-shadow: 0px 0px 20px -7px #485fed
     margin-bottom: 20px
     &::before
        content: ""
        background: linear-gradient(to left, #485fed, rgba(255, 44, 118, .25)), #485fed
        opacity: 0.4
        z-index: -1 // CHILD /*negative*/ /* relative with .mobile-wrapper it's his parent background*/
        display: block
        width: 100%
        height: 40px
        margin: auto
        position: absolute
        bottom: -13px
        left: 50%
        transform: translatex(-50%)
        border-radius: 50%
        box-shadow: 0px 0px 40px 0 #485fed

     .breadcrumb
        font-weight: 400
        position: relative
        font-size: 12px
        &::after
           content: "\f3d1"
           font-family: 'Ionicons'
           vertical-align: middle
           font-size: 10px
           font-weight: 100
           display: inline-block
           color: #fff
           text-align: center
           position: absolute
           left: 45px
           top: 0px


     .date-title
        font-size: 20px
        margin: 3px 0 0 0
        letter-spacing: 1px
        font-weight: 600
        text-shadow: 0px 0px 5px  rgba(#000, 0.15)

     .plus-icon
        position: absolute
        top: 48%
        transform: translateY(-50%)
        right: 20px

  .data-section
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
              width: 75%
              height: 2px
              background-color: #e8e8e8
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

"""

render: -> """
  <div class="mobile-wrapper">

   <!--======= Header =======-->

   <header class="header">
      <div class="container">
         <!--<span>NOT USED CURRENTLY</span>-->
      </div>
   </header>

   <!--======= Title =======-->

   <section class="today-box" id="today-box">
      <h3 class="date-title">My Fritz!Box</h3>
      <span class="breadcrumb" id="model">N/A</span>
      <div class="plus-icon">
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
               <div class="icon"><img id="firmware_icon" src='fritzBoxPro.widget/icons/accept_database.svg' height="20px;"/></div>
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
              <div class="icon"><img id="voicemail" src='fritzBoxPro.widget/icons/voicemail.svg' height="20px;"/></div>
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
  else if (parseInt(values[12]) == 0)
    div.find('#firmware_icon').attr("src", "fritzBoxPro.widget/icons/accept_database.svg")
    div.find('#firmwareUpdateAvailable').attr("style", "display:none")

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

  if (values[10] != "")
    div.find('#nbOfCallsTotal').html(values[10].split(":")[1])

  # --------------- Uptime display ------------------

  if (values[11] != "")
    div.find('#providerName').html(values[11])
