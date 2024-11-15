import React, { useState } from 'react';
import { StyleSheet, Pressable, View, Text } from 'react-native';
import { Image as RNImage } from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { Button } from '@/components/Button';
import { Image } from 'expo-image';

// Add interface at the top of the file
interface ImageItem {
  uri: string;
  name: string;
  type: string | undefined;
}

export default function UploadScreen() {
  const [images, setImages] = useState<ImageItem[]>([]);
  const [selectedImage, setSelectedImage] = useState<ImageItem | null>(null);
  const [metadata, setMetadata] = useState({});

  const pickImages = async () => {
    try {
      const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
      if (status !== 'granted') {
        alert('Sorry, we need camera roll permissions to make this work!');
        return;
      }

      const result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        allowsMultipleSelection: true,
        quality: 0.5,
      });

      if (!result.canceled) {
        const newImages = result.assets.map(asset => ({
          uri: asset.uri,
          name: asset.fileName || 'Unnamed Image',
          type: asset.type,
        }));
        setImages(prevImages => [...prevImages, ...newImages]);
      }
    } catch (error) {
      console.error('Error:', error);
      alert('Failed to pick image');
    }
  };

  const handleImagePress = async (image: ImageItem) => {
    try {
      // Retrieve the width and height for additional metadata (if needed)
      const { width, height } = await new Promise<{ width: number; height: number }>((resolve, reject) => {
        RNImage.getSize(image.uri, (width, height) => resolve({ width, height }), reject);
      });

      // Set the selected image and update metadata
      setSelectedImage(image);
      setMetadata({
        name: image.name,
        uri: image.uri,
        type: image.type,
        width,
        height,
      });
    } catch (error) {
      console.error('Error retrieving metadata:', error);
      alert('Could not retrieve image metadata');
    }
  };

  return (
    <ThemedView style={styles.container}>
      <ThemedText type="title" style={styles.title}>
        Upload Moments
      </ThemedText>
      
      <Button onPress={pickImages} style={styles.uploadButton}>
        <ThemedText>Select Images</ThemedText>
      </Button>

      <ThemedView style={styles.contentContainer}>
        <ThemedView style={styles.imageGrid}>
          {images.map((image, index) => (
            <Pressable 
              key={index} 
              onPress={() => handleImagePress(image)}
              style={styles.imageContainer}
            >
              <Image
                source={{ uri: image.uri }}
                style={styles.thumbnail}
                contentFit="cover"
              />
            </Pressable>
          ))}
        </ThemedView>

        {selectedImage && (
          <ThemedView style={styles.metadataContainer}>
            <Text style={styles.metadataTitle}>Image Details</Text>
            <Text style={styles.metadataItem}>Name: {metadata.name}</Text>
            <Text style={styles.metadataItem}>Type: {metadata.type}</Text>
            <Text style={styles.metadataItem}>Width: {metadata.width}px</Text>
            <Text style={styles.metadataItem}>Height: {metadata.height}px</Text>
          </ThemedView>
        )}
      </ThemedView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
  },
  title: {
    fontSize: 24,
    marginBottom: 20,
  },
  uploadButton: {
    padding: 16,
    borderRadius: 8,
    alignItems: 'center',
    backgroundColor: '#4A90E2',
  },
  contentContainer: {
    flexDirection: 'row',
    marginTop: 20,
  },
  imageGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    flex: 1,
  },
  thumbnail: {
    width: 100,
    height: 100,
    borderRadius: 8,
  },
  imageContainer: {
    width: 100,
    height: 100,
    zIndex: 1,
  },
  metadataContainer: {
    flex: 1,
    marginLeft: 16,
    padding: 16,
    borderColor: '#ccc',
    borderWidth: 1,
    borderRadius: 8,
  },
  metadataTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  metadataItem: {
    fontSize: 14,
    marginBottom: 4,
  },
});
