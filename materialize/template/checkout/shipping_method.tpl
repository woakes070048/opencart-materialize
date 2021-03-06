<div class="row">
	<div class="col s12 l6 offset-l3">
		<div class="card-panel">
			<?php if ($error_warning) { ?>
				<?php echo $error_warning; ?>
			<?php } ?>
			<?php if ($shipping_methods) { ?>
				<h4 class="text-bold"><?php echo $text_shipping_method; ?></h4>
				<?php foreach ($shipping_methods as $shipping_method) { ?>
				<div class="row">
					<div class="col s12">
						<div class="section">
							<strong><i class="material-icons left">&#xE558;</i><?php echo $shipping_method['title']; ?></strong>
							<br><br>
							<?php if (!$shipping_method['error']) { ?>
							<?php foreach ($shipping_method['quote'] as $quote) { ?>
								<?php if ($quote['code'] == $code || !$code) { ?>
								<?php $code = $quote['code']; ?>
									<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" class="with-gap">
								<?php } else { ?>
									<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" class="with-gap">
								<?php } ?>
									<label><?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
								<?php } ?>
							<?php } else { ?>
								<?php echo $shipping_method['error']; ?>
							<?php } ?>
						</div>
					</div>
				</div>
				<?php } ?>
			<?php } ?>
			<div class="row">
				<div class="col s12">
					<div class="section">
						<strong><?php echo $text_comments; ?></strong>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">message</i>
					<textarea name="comment" rows="8" class="materialize-textarea"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<div class="section">
						<input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="btn waves-effect waves-light right red">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
