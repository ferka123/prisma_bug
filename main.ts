import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const song = await prisma.song.create({ data: { name: "test song" } });

  const ramdomWorkMbid = Math.random().toString();

  const test = await prisma.song.update({
    where: { id: song.id },
    data: {
      perfTypes: {
        set: [],
        connectOrCreate: { create: { name: "perf" }, where: { name: "perf" } },
      },
      credits: {
        set: [],
        create: [
          {
            artist: {
              connectOrCreate: {
                create: { name: "Artist", gid: "artist_gid" },
                where: { gid: "artist_gid" },
              },
            },
            credit: {
              connectOrCreate: {
                create: { name: "drummer" },
                where: { name: "drummer" },
              },
            },
          },
          {
            artist: {
              connectOrCreate: {
                create: { name: "Artist2", gid: "artist_gid2" },
                where: { gid: "artist_gid2" },
              },
            },
            credit: {
              connectOrCreate: {
                create: { name: "guitarist" },
                where: { name: "guitarist" },
              },
            },
          },
        ],
      },
      work: {
        connectOrCreate: {
          create: {
            name: "Test work",
            mbid: ramdomWorkMbid,
            iswcs: {
              connectOrCreate: [
                {
                  create: { iswc: "iswc_code" },
                  where: { iswc: "iswc_code" },
                },
                {
                  create: { iswc: "iswc_code2" },
                  where: { iswc: "iswc_code2" },
                },
              ],
            },
            credits: {
              create: [
                {
                  artist: {
                    connectOrCreate: {
                      create: { name: "Artist", gid: "artist_gid" },
                      where: { gid: "artist_gid" },
                    },
                  },
                  credit: {
                    connectOrCreate: {
                      create: { name: "composer" },
                      where: { name: "composer" },
                    },
                  },
                },
                {
                  artist: {
                    connectOrCreate: {
                      create: { name: "Artist", gid: "artist_gid2" },
                      where: { gid: "artist_gid2" },
                    },
                  },
                  credit: {
                    connectOrCreate: {
                      create: { name: "producer" },
                      where: { name: "producer" },
                    },
                  },
                },
              ],
            },
          },
          where: { mbid: ramdomWorkMbid },
        },
      },
      studio: {
        connectOrCreate: {
          create: { name: "test studio", gid: "studio_gid" },
          where: { gid: "studio_gid" },
        },
      },
    },
  });

  console.log(test);
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
