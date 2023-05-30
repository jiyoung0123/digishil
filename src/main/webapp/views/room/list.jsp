<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 py-4 p-xl-5">
            <h2 class="mb-4">Stay on Manhattan, NY</h2>
            <hr class="my-4">
            <form action="#" autocomplete="off">
                <div class="row">
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label" for="form_dates">Dates</label>
                        <div class="datepicker-container datepicker-container-left">
                            <input class="form-control" type="text" name="bookingDate" id="form_dates" placeholder="Choose your dates">
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label" for="form_guests">Guests</label>
                        <select class="selectpicker form-control" name="guests" id="form_guests" data-style="btn-selectpicker" title=" ">
                            <option value="guests_0">1    </option>
                            <option value="guests_1">2    </option>
                            <option value="guests_2">3    </option>
                            <option value="guests_3">4    </option>
                            <option value="guests_4">5    </option>
                        </select>
                    </div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label" for="form_type">Home type</label>
                        <select class="selectpicker form-control" name="type" id="form_type" multiple data-style="btn-selectpicker" data-none-selected-text="">
                            <option value="type_0">Entire place    </option>
                            <option value="type_1">Private room    </option>
                            <option value="type_2">Shared room    </option>
                        </select>
                    </div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label">Price range</label>
                        <div class="text-primary" id="slider-snap"></div>
                        <div class="nouislider-values">
                            <div class="min">From $<span id="slider-snap-value-from"></span></div>
                            <div class="max">To $<span id="slider-snap-value-to"></span></div>
                        </div>
                        <input type="hidden" name="pricefrom" id="slider-snap-input-from" value="40">
                        <input type="hidden" name="priceto" id="slider-snap-input-to" value="110">
                    </div>
                    <div class="col-md-6 col-lg-12 col-xl-8 mb-4 d-xl-flex justify-content-center">
                        <div>
                            <label class="form-label">Host and booking</label>
                            <ul class="list-inline mb-0 mt-1">
                                <li class="list-inline-item">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="instantBook" type="checkbox">
                                        <label class="form-check-label" for="instantBook"> <span class="text-sm">Instant book</span></label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="superhost" type="checkbox">
                                        <label class="form-check-label" for="superhost"> <span class="text-sm">Superhost</span></label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12 pb-4">
                        <div class="collapse" id="moreFilters">
                            <div class="filter-block">
                                <h6 class="mb-3">Location</h6>
                                <div class="row">
                                    <div class="col-xl-4 col-md-6 mb-4 mb-xl-0">
                                        <label class="form-label" for="form_neighbourhood">Neighbourhood</label>
                                        <select class="selectpicker form-control" name="neighbourhood" id="form_neighbourhood" multiple data-style="btn-selectpicker" data-live-search="true" data-selected-text-format="count &gt; 1" data-none-selected-text="">
                                            <option value="neighbourhood_0">Battery Park City    </option>
                                            <option value="neighbourhood_1">Bowery    </option>
                                            <option value="neighbourhood_2">Carnegie Hill    </option>
                                            <option value="neighbourhood_3">Central Park    </option>
                                            <option value="neighbourhood_4">Chelsea    </option>
                                            <option value="neighbourhood_5">Chinatown    </option>
                                            <option value="neighbourhood_6">Civic Center    </option>
                                            <option value="neighbourhood_7">East Harlem    </option>
                                            <option value="neighbourhood_8">Financial District    </option>
                                            <option value="neighbourhood_9">Flatiron    </option>
                                            <option value="neighbourhood_10">Garment District    </option>
                                            <option value="neighbourhood_11">Gramercy Park    </option>
                                            <option value="neighbourhood_12">Greenwich Village    </option>
                                            <option value="neighbourhood_13">East Village    </option>
                                            <option value="neighbourhood_14">West Village    </option>
                                            <option value="neighbourhood_15">Hamilton Heights    </option>
                                            <option value="neighbourhood_16">Harlem    </option>
                                            <option value="neighbourhood_17">Hell's Kitchen / Clinton    </option>
                                            <option value="neighbourhood_18">Inwood    </option>
                                            <option value="neighbourhood_19">Kips Bay    </option>
                                            <option value="neighbourhood_20">Lenox Hill    </option>
                                            <option value="neighbourhood_21">Little Italy    </option>
                                            <option value="neighbourhood_22">Lower Eastside    </option>
                                            <option value="neighbourhood_23">Madison Square    </option>
                                            <option value="neighbourhood_24">Manhattan Valley    </option>
                                            <option value="neighbourhood_25">Meatpacking District    </option>
                                            <option value="neighbourhood_26">Midtown    </option>
                                            <option value="neighbourhood_27">Morningside Heights    </option>
                                            <option value="neighbourhood_28">Murray Hill    </option>
                                            <option value="neighbourhood_29">NoHo    </option>
                                            <option value="neighbourhood_30">NoLita    </option>
                                            <option value="neighbourhood_31">Roosevelt Island    </option>
                                            <option value="neighbourhood_32">SoHo    </option>
                                            <option value="neighbourhood_33">Stuyvesant Town (Stuyvesant Square)    </option>
                                            <option value="neighbourhood_34">Sutton Place    </option>
                                            <option value="neighbourhood_35">Times Square    </option>
                                            <option value="neighbourhood_36">Tribeca    </option>
                                            <option value="neighbourhood_37">Turtle Bay    </option>
                                            <option value="neighbourhood_38">Upper Eastside    </option>
                                            <option value="neighbourhood_39">Upper Westside    </option>
                                            <option value="neighbourhood_40">Washington Heights    </option>
                                            <option value="neighbourhood_41">Yorkville    </option>
                                        </select>
                                    </div>
                                    <div class="col-xl-8">
                                        <label class="form-label">Neighbourhood Tag</label>
                                        <ul class="list-inline mt-xl-1 mb-0">
                                            <li class="list-inline-item">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="type_0" name="type[]">
                                                    <label class="form-check-label" for="type_0">Hipster                                            </label>
                                                </div>
                                            </li>
                                            <li class="list-inline-item">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="type_1" name="type[]">
                                                    <label class="form-check-label" for="type_1">Business                                            </label>
                                                </div>
                                            </li>
                                            <li class="list-inline-item">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="type_2" name="type[]">
                                                    <label class="form-check-label" for="type_2">Family                                            </label>
                                                </div>
                                            </li>
                                            <li class="list-inline-item">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="type_3" name="type[]">
                                                    <label class="form-check-label" for="type_3">Green                                            </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-block">
                                <h6 class="mb-3">Rooms and beds</h6>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <label class="form-label">Beds</label>
                                        <div class="d-flex align-items-center">
                                            <div class="btn btn-items btn-items-decrease">-</div>
                                            <input class="form-control input-items input-items-greaterthan" type="text" value="1+" disabled>
                                            <div class="btn btn-items btn-items-increase">+</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="form-label">Bedrooms</label>
                                        <div class="d-flex align-items-center">
                                            <div class="btn btn-items btn-items-decrease">-</div>
                                            <input class="form-control input-items input-items-greaterthan" type="text" value="1+" disabled>
                                            <div class="btn btn-items btn-items-increase">+</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="form-label">Bathrooms</label>
                                        <div class="d-flex align-items-center">
                                            <div class="btn btn-items btn-items-decrease">-</div>
                                            <input class="form-control input-items input-items-greaterthan" type="text" value="1+" disabled>
                                            <div class="btn btn-items btn-items-increase">+</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-block">
                                <h6 class="mb-3">Trip type</h6>
                                <div class="row pt-1">
                                    <div class="col-sm-6">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" id="forfamilies" type="checkbox" name="forfamilies" aria-describedby="forfamiliesHelp">
                                            <label class="form-check-label" for="forfamilies"> <span class="text-sm">For Families</span></label>
                                        </div><small class="text-muted form-text" id="forfamiliesHelp">Explore entire homes with 5-star reviews from families and essentials like a kitchen and TV</small>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" id="forwork" type="checkbox" name="forwork" aria-describedby="forworkHelp">
                                            <label class="form-check-label" for="forwork"> <span class="text-sm">For work</span></label>
                                        </div><small class="text-muted form-text" id="forworkHelp">Explore top-rated homes with essentials like a workspace, wifi, and self check-in</small>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-block">
                                <h6 class="mb-3">Amenities</h6>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_0" name="amenities[]">
                                            <label class="form-check-label" for="amenities_0">Kitchen                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_1" name="amenities[]">
                                            <label class="form-check-label" for="amenities_1">Shampoo                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_2" name="amenities[]">
                                            <label class="form-check-label" for="amenities_2">Heating                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_3" name="amenities[]">
                                            <label class="form-check-label" for="amenities_3">Air conditioning                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_4" name="amenities[]">
                                            <label class="form-check-label" for="amenities_4">Washer                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_5" name="amenities[]">
                                            <label class="form-check-label" for="amenities_5">Dryer                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_6" name="amenities[]">
                                            <label class="form-check-label" for="amenities_6">Wifi                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_7" name="amenities[]">
                                            <label class="form-check-label" for="amenities_7">Breakfast                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_8" name="amenities[]">
                                            <label class="form-check-label" for="amenities_8">Indoor fireplace                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_9" name="amenities[]">
                                            <label class="form-check-label" for="amenities_9">Buzzer/wireless intercom                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_10" name="amenities[]">
                                            <label class="form-check-label" for="amenities_10">Doorman                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_11" name="amenities[]">
                                            <label class="form-check-label" for="amenities_11">Hangers                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_12" name="amenities[]">
                                            <label class="form-check-label" for="amenities_12">Iron                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_13" name="amenities[]">
                                            <label class="form-check-label" for="amenities_13">Hair dryer                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="amenities_14" name="amenities[]">
                                            <label class="form-check-label" for="amenities_14">Laptop friendly workspace                               </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="filter-block">
                                <h6 class="mb-3">Facilities</h6>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="facilities_0" name="facilities[]">
                                            <label class="form-check-label" for="facilities_0">Free parking on premises                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="facilities_1" name="facilities[]">
                                            <label class="form-check-label" for="facilities_1">Gym                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="facilities_2" name="facilities[]">
                                            <label class="form-check-label" for="facilities_2">Hot tub                               </label>
                                        </div>
                                    </li>
                                    <li class="list-inline-item">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="facilities_3" name="facilities[]">
                                            <label class="form-check-label" for="facilities_3">Pool                               </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 mb-4 order-2 order-sm-1">
                        <button class="btn btn-primary" type="submit"> <i class="fas fa-search me-1"></i>Search                </button>
                    </div>
                    <div class="col-sm-6 mb-4 text-sm-end order-1 order-sm-2">
                        <button class="btn btn-link btn-collapse ps-0 text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#moreFilters" aria-expanded="false" aria-controls="moreFilters" data-expanded-text="Less filters" data-collapsed-text="More filters">More filters</button>
                    </div>
                </div>
            </form>
            <hr class="my-4">
            <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                <div class="me-3">
                    <p class="mb-3 mb-md-0"><strong>12</strong> results found</p>
                </div>
                <div>
                    <label class="form-label me-2" for="form_sort">Sort by</label>
                    <select class="selectpicker" name="sort" id="form_sort" data-style="btn-selectpicker" title="">
                        <option value="sortBy_0">Most popular   </option>
                        <option value="sortBy_1">Recommended   </option>
                        <option value="sortBy_2">Newest   </option>
                        <option value="sortBy_3">Oldest   </option>
                        <option value="sortBy_4">Closest   </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <!-- place item-->
                <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="detail-rooms.html"></a>
                            <div class="card-img-overlay-bottom z-index-20">
                                <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-0.jpg" alt="Pamela"/>
                                    <div>Pamela</div>
                                </div>
                            </div>
                            <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                </svg></a></div>
                        </div>
                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern, Well-Appointed Room</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">Private room</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">$80</span> per night</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="detail-rooms.html"></a>
                            <div class="card-img-overlay-bottom z-index-20">
                                <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-7.jpg" alt="John"/>
                                    <div>John</div>
                                </div>
                            </div>
                            <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                </svg></a></div>
                        </div>
                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Cute Quirky Garden apt, NYC adjacent</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">Entire apartment</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">$121</span> per night</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="detail-rooms.html"></a>
                            <div class="card-img-overlay-bottom z-index-20">
                                <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-8.jpg" alt="Julie"/>
                                    <div>Julie</div>
                                </div>
                            </div>
                            <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                </svg></a></div>
                        </div>
                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern Apt - Vibrant Neighborhood!</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">Entire apartment</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">$75</span> per night</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="detail-rooms.html"></a>
                            <div class="card-img-overlay-bottom z-index-20">
                                <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-9.jpg" alt="Barbora"/>
                                    <div>Barbora</div>
                                </div>
                            </div>
                            <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                </svg></a></div>
                        </div>
                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Sunny Private Studio-Apartment</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">Shared room</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">$93</span> per night</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise"/><a class="tile-link" href="detail-rooms.html"></a>
                            <div class="card-img-overlay-bottom z-index-20">
                                <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-10.jpg" alt="Jack"/>
                                    <div>Jack</div>
                                </div>
                            </div>
                            <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                </svg></a></div>
                        </div>
                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Mid-Century Modern Garden Paradise</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">Entire house</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">$115</span> per night</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- place item-->
                <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                    <div class="card h-100 border-0 shadow">
                        <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan"/><a class="tile-link" href="detail-rooms.html"></a>
                            <div class="card-img-overlay-bottom z-index-20">
                                <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-11.jpg" alt="Stuart"/>
                                    <div>Stuart</div>
                                </div>
                            </div>
                            <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                </svg></a></div>
                        </div>
                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Brooklyn Life, Easy to Manhattan</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">Private room</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">$123</span> per night</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-template d-flex justify-content-center">
                    <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a></li>
                </ul>
            </nav>
        </div>
        <div class="col-lg-6 map-side-lg pe-lg-0">
            <div class="map-full shadow-left" id="categorySideMap"></div>
        </div>
    </div>
</div>


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

<script>
    createListingsMap({
        mapId: 'categorySideMap',
        jsonFile: 'js/rooms-geojson.json',
        mapPopupType: 'rental',
        useTextIcon: true,
        //tileLayer: tileLayers[5]  - uncomment for a different map styling
    });

</script>
<!-- Daterange picker-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js"> </script>
<script src="/js/datepicker-category.js"> </script>
<!-- Price Slider-->
<script src="/vendor/nouislider/nouislider.min.js"></script>
<script>
    var snapSlider = document.getElementById('slider-snap');

    noUiSlider.create(snapSlider, {
        start: [ 40, 110 ],
        snap: false,
        connect: true,
        step: 1,
        range: {
            'min': 40,
            'max': 110
        }
    });
    var snapValues = [
        document.getElementById('slider-snap-value-from'),
        document.getElementById('slider-snap-value-to')
    ];
    var inputValues = [
        document.getElementById('slider-snap-input-from'),
        document.getElementById('slider-snap-input-to')
    ];
    snapSlider.noUiSlider.on('update', function( values, handle ) {
        snapValues[handle].innerHTML = values[handle];
        inputValues[handle].value = values[handle];
    })
</script>
