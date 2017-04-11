$(document).ready(function() {
	//	参数
	//	minSpeedX: 0.1,
	//  maxSpeedX: 0.7,
	//  minSpeedY: 0.1,
	//  maxSpeedY: 0.7,
	//  directionX: 'center', // 'center', 'left' or 'right'. 'center' = dots bounce off edges
	//  directionY: 'center', // 'center', 'up' or 'down'. 'center' = dots bounce off edges
	//  density: 10000, // How many particles will be generated: one particle every n pixels
	//  dotColor: '#666666',
	//  lineColor: '#666666',
	//  particleRadius: 7, // Dot size
	//  lineWidth: 1,
	//  curvedLines: false,
	//  proximity: 100, // How close two dots need to be before they join
	//  parallax: true,
	//  parallaxMultiplier: 5, // The lower the number, the more extreme the parallax effect
	//	onInit: function() {},
	//  onDestroy: function() {}
	$('#wrapper').particleground({
	dotColor: 'rgba(61,161,205,.1)',
	lineColor: 'rgba(61,161,205,.3)',
	minSpeedX: 0.1,
	maxSpeedX: 0.5,
	minSpeedY: 0.1,
	maxSpeedY: 0.5,
	density: 30000,
	proximity: 200
	  });
	$('.login-area').css({
	'margin-top': -($('.login-area').height() / 2 + 50)
	});
});