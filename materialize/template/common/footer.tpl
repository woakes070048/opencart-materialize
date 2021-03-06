	<footer class="page-footer blue-grey darken-3">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<div class="col s12">
						<h5 class="white-text text-bold">MyEfforts — интернет магазин спортивного питания</h5>
						<p class="grey-text text-lighten-4">Далеко-далеко за словесными горами в стране, гласных и согласных живут рыбные тексты. Которой заглавных курсивных сих над последний скатился! Парадигматическая деревни взобравшись страну рыбного, курсивных последний одна над раз инициал встретил ipsum о, алфавит!</p>
					</div>
				</div>
				<div class="col l4 offset-l2 s12">
					<div class="row">
						<?php if ($informations) { ?>
						<section class="col s6">
							<h5 class="white-text text-bold"><?php echo $text_information; ?></h5>
							<ul>
							<?php foreach ($informations as $information) { ?>
								<li><a class="grey-text text-lighten-3" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
							<?php } ?>
								<li><a class="grey-text text-lighten-3" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
							</ul>
						</section>
						<?php } ?>
						<section class="col s6">
							<h5 class="white-text text-bold"><?php echo $text_extra; ?></h5>
							<ul>
								<li><a class="grey-text text-lighten-3" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
								<li><a class="grey-text text-lighten-3" href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
								<li><a class="grey-text text-lighten-3" href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
								<li><a class="grey-text text-lighten-3" href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
							</ul>
						</section>
					</div>
					<div class="row">
						<section class="col s6">
							<h5 class="white-text text-bold"><?php echo $text_account; ?></h5>
							<ul>
								<li><a class="grey-text text-lighten-3" href="<?php echo $account; ?>" rel="nofollow"><?php echo $text_account; ?></a></li>
								<li><a class="grey-text text-lighten-3" href="<?php echo $order; ?>" rel="nofollow"><?php echo $text_order; ?></a></li>
								<li><a class="grey-text text-lighten-3" href="<?php echo $wishlist; ?>" rel="nofollow"><?php echo $text_wishlist; ?></a></li>
								<li><a class="grey-text text-lighten-3" href="<?php echo $newsletter; ?>" rel="nofollow"><?php echo $text_newsletter; ?></a></li>
							</ul>
						</section>
						<section class="col s6">
							<h5 class="white-text text-bold">Мы в соцсетях</h5>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				<?php echo $powered; ?>
				<a class="grey-text text-lighten-4 right" href="https://github.com/trydalcoholic" target="_blank">Created by Trydalcoholic</a>
			</div>
		</div>
	</footer>
	<aside>
		<div class="preloader z-depth-3"><div class="preloader-wrapper small active"><div class="spinner-layer spinner-blue"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div><div class="spinner-layer spinner-red"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div><div class="spinner-layer spinner-yellow"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div><div class="spinner-layer spinner-green"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div></div>
	</aside>
	<script defer src="catalog/view/theme/materialize/js/script.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function(event) {
			$(".modal-call-back-btn").click(function() {
				$('#modal-call-back').remove();
				html  = '<form id="modal-call-back" class="modal">';
				html += 	'<div class="modal-content">';
				html += 		'<i class="material-icons modal-action modal-close right">close</i>';
				html += 		'<h4>Заказать звонок</h4>';
				html += 		'<div class="row">';
				html += 			'<div class="input-field">';
				html += 				'<i class="material-icons prefix">account_circle</i>';
				html += 				'<input id="cb-name" name="name" type="text" class="validate" required>';
				html += 				'<label for="cb-name">Как вас зовут</label>';
				html += 			'</div>';
				html += 			'<div class="input-field">';
				html += 				'<i class="material-icons prefix">phone</i>';
				html += 				'<input id="cb-telephone" name="tel" type="tel" class="validate" data-inputmask="\'mask\':\'8 (999) 999-99-99\'" required>';
				html += 				'<label for="cb-telephone">Ваш номер телефона</label>';
				html += 			'</div>';
				html += 		'</div>';
				html += 	'</div>';
				html += 	'<div class="modal-footer href-underline">';
				html += 		'<input type="hidden" name="admin_email" value="<?php echo $email; ?>">';
				html += 		'<input type="submit" class="btn modal-action red right" value="Заказать звонок">';
				html += 	'</div>';
				html += '</form>';
				$('body').append(html);
				$('#modal-call-back').modal();
				$('#modal-call-back').modal('open');
				$(":input").inputmask();
				$('#modal-call-back').submit(function() {
					$.ajax({
						url: 'catalog/view/theme/materialize/call_back.php',
						type: 'post',
						data: $(this).serialize(),
						success: function() {
							Materialize.toast('<span><i class="material-icons left">check</i>Ваша заявка успешно отправлена!</span>',7000,'toast-success rounded');
							$(".modal-close").click();
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
					return false;
				});
			});
		});
	</script>
</body>
</html>