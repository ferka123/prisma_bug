-- CreateTable
CREATE TABLE `songs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `gid` VARCHAR(191) NULL,
    `name` VARCHAR(191) NOT NULL,
    `work_id` INTEGER NULL,
    `studio_id` INTEGER NULL,

    UNIQUE INDEX `songs_gid_key`(`gid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `artists` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `gid` VARCHAR(191) NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `artists_gid_key`(`gid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `credit_type` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `priority` INTEGER NOT NULL DEFAULT 0,

    UNIQUE INDEX `credit_type_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_artist_credits` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `artist_id` INTEGER NOT NULL,
    `credit_id` INTEGER NOT NULL,
    `work_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `work_artist_credits_artist_id_credit_id_work_id_key`(`artist_id`, `credit_id`, `work_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Work` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `mbid` VARCHAR(191) NULL,

    UNIQUE INDEX `Work_mbid_key`(`mbid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `iswcs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `iswc` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `iswcs_iswc_key`(`iswc`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `studios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `gid` VARCHAR(191) NULL,

    UNIQUE INDEX `studios_gid_key`(`gid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_IswcToWork` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_IswcToWork_AB_unique`(`A`, `B`),
    INDEX `_IswcToWork_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `songs` ADD CONSTRAINT `songs_work_id_fkey` FOREIGN KEY (`work_id`) REFERENCES `Work`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `songs` ADD CONSTRAINT `songs_studio_id_fkey` FOREIGN KEY (`studio_id`) REFERENCES `studios`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `work_artist_credits` ADD CONSTRAINT `work_artist_credits_artist_id_fkey` FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `work_artist_credits` ADD CONSTRAINT `work_artist_credits_credit_id_fkey` FOREIGN KEY (`credit_id`) REFERENCES `credit_type`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `work_artist_credits` ADD CONSTRAINT `work_artist_credits_work_id_fkey` FOREIGN KEY (`work_id`) REFERENCES `Work`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_IswcToWork` ADD CONSTRAINT `_IswcToWork_A_fkey` FOREIGN KEY (`A`) REFERENCES `iswcs`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_IswcToWork` ADD CONSTRAINT `_IswcToWork_B_fkey` FOREIGN KEY (`B`) REFERENCES `Work`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
