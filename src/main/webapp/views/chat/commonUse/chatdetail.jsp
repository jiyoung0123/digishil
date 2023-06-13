<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  $(document).ready( async () => {
    await display();
    chatDetails.init();
    // 고민해보자. - (1) 서버 문제가 있고 (2) jsp이기 때문에 새로고침되는 문제.
    // setInterval(() => {
    //   display();
    // }, 3000);
  });

  let chatDetails = {
    init: (() => {
      $(document).on('click', '.detectBtn', function(){
        console.log('clicked');
        let text = $(this).data('chat-contents');
        $.ajax({
          url: 'chat/detectLanguage',
          data: {
           // 'text': $(this).closest('.d-flex').find('.bg-gray-200 p').text()
            'text' : text
          }
        }).done(function(data) {
          console.log('succeed to detect language');
          data = JSON.parse(data);
          console.log("===감지결과===");
          console.log(data.langCode);
          if(data.langCode !== undefined && data.langCode !== 'ko') {
            console.log('번역가능. ');
              translate(data.langCode, text);
          }else{
            console.log('원래 한국어이거나 인식을 못한 경우로 번역할 수 없습니다.');
          }
        }).fail(function() {
          console.log('failed');
        });
      })

      $('#buttonSendMessage').click(() => {
        console.log('clicked');
        sendData();
      });
    })
  };

  function translate(sourceLanguage, text){
    $.ajax({
      url : 'chat/translate',
      data : {
        'targetLanguage' : sourceLanguage,
        'text' : text
      }
    }).done((data)=>{
      console.log('succeed to load translation data');
      data = JSON.parse(data);
      console.log("=====번역결과=====");
      translatedResult = data.message.result.translatedText;
      console.log(data.message.result.translatedText);
      $('#chatContents').text(data.message.result.translatedText);
    }).fail(()=>{
      console.log('failed');
    })
  }

  function sendData() {
    $.ajax({
      url: 'chat/request',
      data: {
        'chatContents': $('#chatContents').val(),
        'chatRoomId': $('#chatRoomId').val(),
        'chatSender': $('#chatSender').val()
      }
    })
            .done((data) => {
              console.log("success");
              // chatDetails.display(data);
              display();
            })
            .fail(() => {
              console.log("failed to load data");
            });
  }

  function display(){
    let chatSender = $('#chatSender').val();
    console.log(chatSender);
    $.ajax({
      url: 'chat/display',
      data: {
        chatRoomId: $('#chatRoomId').val(),
        chatSender: $('#chatSender').val()
      }
    }).done((data)=>{
      console.log('success');
      console.log(data);
      $('#chatContainer').empty();
      //시간 순서대로 나열
      data.sort((a, b) => new Date(a.chatDate) - new Date(b.chatDate));
      data.forEach(obj => {
        //console.log('====');
        //console.log(obj.chatSender);
        if(obj.chatSender == chatSender){
          let html =
                  `
                  <div class="d-flex col-md-9 col-xl-7 ms-lg-auto mb-3" >
                  <div class="ms-auto">
                  <div class="bg-primary rounded p-4 mb-2">
                  <p class="text-sm mb-0 text-white" id="chatContents">\${obj.chatContents}</p>
                  </div>
                  <p class="small text-muted ms-3">\${obj.chatDate}<button type="button" class="btn detectBtn" data-chat-contents="\${obj.chatContents}">번역</button></p>
                  </div>
                  <img class="avatar avatar-border-white flex-shrink-0" src="img/avatar/avatar-10.jpg" alt="user">
                  </div>
                  `;
          $('#chatContainer').append(html);
        }else{
          let html =
                  `
                  <div class="d-flex col-md-9 col-xl-7 mb-3">
                  <img class="avatar avatar-border-white flex-shrink-0" src="img/avatar/avatar-1.jpg" alt="user">
                  <div class="ms-3">
                  <div class="bg-gray-200 rounded p-4 mb-2">
                  <p id="chatContents">\${obj.chatContents}</p>
                  </div>
                  <p class="small text-muted ms-3">\${obj.chatDate}<button type="button" class="btn detectBtn" data-chat-contents="\${obj.chatContents}">번역</button></p>
                  </div>
                  </div>
                  `
          $('#chatContainer').append(html);
        }
    })}).fail(()=>{
      console.log('failed');
    })

  }//end of display function







</script>


<body style="padding-top: 72px;">
    <section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item"><a href="user-messages.html">Inbox</a></li>
          <li class="breadcrumb-item active">Your messages with 누구누구인지 넣어야해   </li>
        </ol>
        <div class="d-flex flex-column flex-md-row justify-content-md-between align-items-md-center mb-4">
          <h1 class="mb-3 mb-md-0 hero-heading mb-0">Your messages with Anna</h1>
          <div><a class="btn btn-link ps-0" href="user-messages.html"><i class="fa fa-arrow-left me-2"></i> Back to all messages</a></div>
        </div>
        <div class="card border-0 shadow mb-4">
          <div class="card-body p-4">
            <div class="text-block pb-3">
              <div class="d-flex align-items-center justify-content-between">
                <div>
                  <h6> <a class="text-reset" href="detail-rooms.html">Modern Apt - Vibrant Neighborhood</a></h6>
                  <p class="text-muted text-sm mb-0">Entire home in New York</p>
                  <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                  </div>
                </div><a href="detail-rooms.html"><img class="ms-3 rounded flex-shrink-0" src="img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="" width="100"></a>
              </div>
            </div>
            <div class="text-block pt-3 pb-0">
              <ul class="list-unstyled text-sm mb-0">
                <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>3 guests</li>
                <li class="mb-0"><i class="far fa-calendar fa-fw text-muted me-2"></i>Apr 17, 2019 <i class="fas fa-arrow-right fa-fw text-muted mx-3"></i>Apr 18, 2019</li>
              </ul>
            </div>
          </div>
        </div>
        <!-- (1) JSP로 뿌리는 방식 -->

        <!-- (2) script로 뿌리는 방식 -->
        <div class="px-4 py-5">
          <div class="row" id="chatContainer" style="display:inline">

          </div>
        </div>
        <!-- Typing area-->
        <form class="bg-light rounded shadow-sm" action="#">
          <div class="input-group">
            <input type="hidden" id="chatRoomId" value="${chatRoomId}"/>
            <input type="hidden" id="chatSender" value="${hostId}"/>
            <textarea class="form-control border-0 p-4 bg-light text-sm" id="chatContents" placeholder="Type a message" aria-describedby="button-sendMessage"></textarea>
            <button class="btn btn-link" id="buttonSendMessage" type="button"><i class="fa fa-paper-plane"></i></button>
          </div>
        </form>
      </div>
    </section>
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
      <!-- Main block - menus, subscribe form-->
      <div class="py-6 bg-gray-200 text-muted"> 
        <div class="container">
          <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0">
              <div class="fw-bold text-uppercase text-dark mb-3">Directory</div>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
              <ul class="list-inline">
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="twitter"><i class="fab fa-twitter"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="pinterest"><i class="fab fa-pinterest"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="vimeo"><i class="fab fa-vimeo"></i></a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Rentals</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="index.html">Rooms</a></li>
                <li><a class="text-muted" href="category-rooms.html">Map on top</a></li>
                <li><a class="text-muted" href="category-2-rooms.html">Side map</a></li>
                <li><a class="text-muted" href="category-3-rooms.html">No map</a></li>
                <li><a class="text-muted" href="detail-rooms.html">Room detail</a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Pages</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="compare.html">Comparison                                   </a></li>
                <li><a class="text-muted" href="team.html">Team                                   </a></li>
                <li><a class="text-muted" href="contact.html">Contact                                   </a></li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>
              <p class="mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
              <form action="#" id="newsletter-form">
                <div class="input-group mb-3">
                  <input class="form-control bg-transparent border-dark border-end-0" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
                  <button class="btn btn-outline-dark border-start-0" type="submit"> <i class="fa fa-paper-plane text-lg"></i></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="text-sm mb-md-0">&copy; 2021, Your company.  All rights reserved.</p>
            </div>
            <div class="col-md-6">
              <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                <li class="list-inline-item"><img class="w-2rem" src="img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/western-union.svg" alt="..."></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="js/theme.js"></script>
  </body>
