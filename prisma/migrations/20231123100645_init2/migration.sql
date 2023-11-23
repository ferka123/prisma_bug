-- CreateTable
CREATE TABLE `song_artist_credits` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `artist_id` INTEGER NOT NULL,
    `credit_id` INTEGER NOT NULL,
    `song_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `song_artist_credits_artist_id_credit_id_song_id_key`(`artist_id`, `credit_id`, `song_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `song_artist_credits` ADD CONSTRAINT `song_artist_credits_artist_id_fkey` FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `song_artist_credits` ADD CONSTRAINT `song_artist_credits_credit_id_fkey` FOREIGN KEY (`credit_id`) REFERENCES `credit_type`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `song_artist_credits` ADD CONSTRAINT `song_artist_credits_song_id_fkey` FOREIGN KEY (`song_id`) REFERENCES `songs`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
